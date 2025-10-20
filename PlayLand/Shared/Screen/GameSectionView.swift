//
//  GameSectionView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//
import SwiftUI

struct GameSectionView: View {
    
    let title: String
    let games: [ITunesApp]
    let coordinator: AppCoordinator
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.horizontal, 4)
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(games.prefix(4)) { game in 
                    GameCardView(game: game)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            coordinator.navigate(to: .appDetail(app: game))
                        }
                }
            }
        }
    }
}

