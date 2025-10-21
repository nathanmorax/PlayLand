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
            HStack(alignment: .top, spacing: 8) {
                
                CoverImageAppView(coverImageApp: game.artworkUrl100, size: .small)
                
                Text(game.trackName)
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Text(game.artistName)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .truncationMode(.tail)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 140)
        .padding(6)
        .cornerRadius(12)
    }
}

