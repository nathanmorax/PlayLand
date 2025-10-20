//
//  GameGenreButton.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct GameGenreButton: View {
    @Binding var selectedGenre: GameGenre?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(GameGenre.allCases) { genre in
                    Button(action: {
                        selectedGenre = genre
                    }) {
                        Text(genre.rawValue)
                        
                        Image(systemName: genre.iconGenre)
                            .foregroundColor(genre.colorIconGenre)

                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(selectedGenre == genre ? Color.blue : Color.gray.opacity(0.3))
                    .foregroundColor(selectedGenre == genre ? .white : .black)
                    .cornerRadius(7)
                }
            }
        }
    }
}
