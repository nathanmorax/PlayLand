//
//  GameListView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//

import SwiftUI

struct GameListView: View {
    let genre: GameGenre
    let games: [ITunesApp]
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 22) {
                ForEach(games) { game in
                    GameRowView(game: game, coordinator: coordinator)
                }
            }
            .padding()
        }
        .navigationTitle(genre.rawValue ?? "")
    }
}

