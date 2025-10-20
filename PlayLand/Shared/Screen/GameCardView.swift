//
//  GameCardView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//

import SwiftUI

struct GameCardView: View {
    let game: ITunesApp
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // HStack con imagen y trackName
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
                
                Text(game.trackName)
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            // Artist name debajo de todo
            Text(game.artistName)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .truncationMode(.tail)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 140) // ancho fijo de la card
        .padding(6)
        .cornerRadius(12)
    }
}

