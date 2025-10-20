//
//  GameDetailView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct GameDetailView: View {
    let app: ITunesApp

    var body: some View {
        VStack(spacing: 16) {
            Text(app.trackName).font(.title).bold()
            Text(app.artistName).foregroundColor(.secondary)

        }
        .padding()
        .navigationTitle(app.trackName)
    }
}
