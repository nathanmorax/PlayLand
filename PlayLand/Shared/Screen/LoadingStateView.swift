//
//  File.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct LoadingStateView: View {
    let messageState: String
    let imageState: String
    
    var body: some View {
        VStack(spacing: 22) {
            Image(imageState)
                .resizable()
                .frame(width: 160, height: 160)

            Text(messageState)
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }

}


