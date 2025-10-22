//
//  GameHomeViewModel.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//
import Combine
import Foundation

class GameHomeViewModel: ObservableObject {
    
    @Published var allGames: [ITunesApp] = []
    @Published var mostPlayed: [ITunesApp] = []
    @Published var topRated: [ITunesApp] = []
    @Published var filteredGames: [ITunesApp] = []
    @Published var loadingState: LoadingState = .idle
    
    
    private let RSSAppFetcher: RSSAppFetcher
    private var disposables = Set<AnyCancellable>()
    
    init(RSSAppFetcher: RSSAppFetcher) {
        self.RSSAppFetcher = RSSAppFetcher
    }
    
    
    func loadGame() {
        
        guard loadingState != .loading else { return }
        
        loadingState = .loading
        
        RSSAppFetcher.mostPlayed()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching apps: ", error)
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                
                self.allGames = response.results
                
                if response.results.isEmpty {
                    self.loadingState = .empty
                } else {
                    self.processGames()
                    self.loadingState = .loaded
                }
                
            })
            .store(in: &disposables)
    }
    
    func retry() {
        loadGame()
    }
    
    func filter(by genre: GameGenre?) {
        guard let genre = genre else {
            filteredGames = allGames
            return
        }
        filteredGames = allGames.filter { $0.genres.contains(genre.rawValue) }

    }
    
    private func processGames() {
        mostPlayed = allGames
            .sorted { $0.userRatingCount > $1.userRatingCount }
        
        topRated = allGames
            .sorted { $0.averageUserRating > $1.averageUserRating }
    }
    
}
