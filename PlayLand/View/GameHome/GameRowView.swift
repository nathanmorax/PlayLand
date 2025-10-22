//
//  GameRowView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 21/10/25.
//
import SwiftUI


struct GameRowView: View {
    let game: ITunesApp
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 0) {
            CoverImageAppView(coverImageApp: game.artworkUrl512, size: .large)
                .frame(maxWidth: .infinity)
                .allowsHitTesting(false)
                .clipShape(RoundedCornerShape(radius: 12, corners: [.topLeft, .topRight]))

            HStack(spacing: 4) {
                CoverImageAppView(coverImageApp: game.artworkUrl100, size: .small)

                VStack(alignment: .leading) {
                    Text(game.trackName)
                        .font(.headline)
                        .lineLimit(1)

                    Text(game.artistName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                Button(action: {
                    coordinator.navigate(to: .appDetail(app: game))
                }) {
                    Text("See More")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .clipShape(RoundedCornerShape(radius: 12, corners: [.bottomLeft, .bottomRight]))
        }
    }
}
