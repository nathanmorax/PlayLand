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
                        AsyncImage(url: URL(string: game.artworkUrl100 ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 70, height: 70)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(12)
                                    .shadow(radius: 3)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.gray.opacity(0.5))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
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
