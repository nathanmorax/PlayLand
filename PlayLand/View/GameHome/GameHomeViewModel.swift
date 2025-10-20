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
    @Published var titleSection: String = ""
    
    private let RSSAppFetcher: RSSAppFetcher
    private var disposables = Set<AnyCancellable>()
    
    init(RSSAppFetcher: RSSAppFetcher) {
        self.RSSAppFetcher = RSSAppFetcher
    }
    
    
    func loadGame() {
        RSSAppFetcher.mostPlayed() // Aquí usamos tu fetch genérico
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching apps: ", error)
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                
                self.allGames = response.results
                
                
                // Sección Most Played → más ratings
                self.mostPlayed = allGames
                    .filter { $0.userRatingCount != nil }
                    .sorted { ($0.userRatingCount ?? 0) > ($1.userRatingCount ?? 0) }
                
                // Sección Top Rated → mejor calificación promedio
                self.topRated = allGames
                    .filter { $0.averageUserRating != nil }
                    .sorted { ($0.averageUserRating ?? 0) > ($1.averageUserRating ?? 0) }
                
                filteredGames
                
            })
            .store(in: &disposables)
    }
    
    func filter(by genre: GameGenre?) {
        guard let genre = genre else {
            filteredGames = allGames
            return
        }
        filteredGames = allGames.filter { $0.genres.contains(genre.rawValue) }
        
        print("🎮 Juegos del género \(genre.rawValue):")
        for game in filteredGames{
            print("- \(game.trackName) by \(game.artistName)")
        }
    }
    
}
