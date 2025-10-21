//
//  IconAppView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct IconAppView: View {
    var iconApp: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: iconApp)) { icon in
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 8)
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            }
        }
    }
}

