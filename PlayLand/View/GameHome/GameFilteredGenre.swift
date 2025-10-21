//
//  GameFilteredGenre.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//

import SwiftUI

struct GameFilteredGenre: View {
    let genre: GameGenre
    let games: [ITunesApp]
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(games) { game in
                    
                    HStack(alignment: .top, spacing: 8) {
                        CoverImageAppView(coverImageApp: game.artworkUrl100, size: .small)
                        
                        
                        VStack(alignment: .leading) {
                            
                            Spacer()
                            Text("Play Land")
                            
                            Text(game.trackName)
                              
                        }
                    
                        Spacer()
                        
                        Button(action: {
                            coordinator.navigate(to: .appDetail(app: game))
                        }) {
                            Text("See More")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    
                }
            }
            .padding()
        }
        .navigationTitle(genre.rawValue)
    }
}
