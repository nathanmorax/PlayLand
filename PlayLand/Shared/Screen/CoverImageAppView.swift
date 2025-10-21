//
//  CoverImageAppView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//

import SwiftUI

struct CoverImageAppView: View {
    var coverImageApp: String
    var body: some View {
        AsyncImage(url: URL(string: coverImageApp)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: 280)
                .frame(maxWidth: .infinity)
                .clipped()
        } placeholder: {
            Color.gray.opacity(0.3)
                .frame(height: 280)
                .frame(maxWidth: .infinity)
        }
    }
}
