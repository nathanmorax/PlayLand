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
    
            CoverImageAppView(coverImageApp: game.artworkUrl100, size: .small)
                .frame(maxWidth: .infinity)
            
            Text(game.trackName)
                .infoTitle()
            
            Text(game.artistName)
                .infoDetail()
           
        }
        .frame(width: 140)
        .padding(6)
        .cornerRadius(12)
    }
}

