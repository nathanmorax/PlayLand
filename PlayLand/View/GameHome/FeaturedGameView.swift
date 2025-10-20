//
//  FeaturedGameView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//
import SwiftUI

struct FeaturedGameView: View {
    var body: some View {
        ZStack {
            Image("Balatro+")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
            
            Spacer()
            VStack {
                Spacer()
                Text("Farmd Hero")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                
                Text("Crea tu propio paraiso")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
            .padding(.leading, -170)
            .padding(.vertical)
        }
        .cornerRadius(12)
    }
}
