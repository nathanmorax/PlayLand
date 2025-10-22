//
//  GameHomeViewModel.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//
import Combine
import Foundation

class GameHomeViewModel: ObservableObject {
    
    @Published private(set) var  allGames: [ITunesApp] = []
    @Published private(set) var  mostPlayed: [ITunesApp] = []
    @Published private(set) var  topRated: [ITunesApp] = []
    @Published private(set) var  filteredGames: [ITunesApp] = []
    @Published var loadingState: LoadingState = .idle
    @Published var selectedGenre: GameGenre? = nil
    
    private let RSSAppFetcher: RSSAppFetcher
    private var disposables = Set<AnyCancellable>()
    
    init(RSSAppFetcher: RSSAppFetcher) {
        self.RSSAppFetcher = RSSAppFetcher
        self.setupBindings()
    }
    
    private func setupBindings() {
        $selectedGenre
            .sink { [weak self] genre in
                self?.applyFilter(genre: genre)
            }
            .store(in: &disposables)
    }
    
    func loadGame() {
        
        
        guard loadingState != .loading else { return }
        loadingState = .loading
        
        if let cached = GameCache.shared.getGames() {
            allGames = cached
            processGames()
            loadingState = .loaded
            return
        }
        
        RSSAppFetcher.getAppGames()
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
                    GameCache.shared.save(response.results)
                    self.processGames()
                    self.loadingState = .loaded
                }
                
            })
            .store(in: &disposables)
    }
    
    func retry() {
        loadGame()
    }
    
    private func applyFilter(genre: GameGenre?) {
        if let genre = genre {
            filteredGames = allGames.filter { $0.genres.contains(genre.rawValue) }
        } else {
            filteredGames = allGames
        }
    }
    
    private func processGames() {
        mostPlayed = allGames
            .sorted { $0.userRatingCount > $1.userRatingCount }
        
        topRated = allGames
            .sorted { $0.averageUserRating > $1.averageUserRating }
    }
    
}
