//
//  StateUIView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct StateUIView: View {
    let state: LoadingState
    let onRetry: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            stateImage
            
            Text(state.messageState)
                .font(.title2)
                .fontWeight(.semibold)
            
            if shouldShowRetryButton {
                Button(action: onRetry) {
                    Label("Try Again", systemImage: "arrow.clockwise")
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    @ViewBuilder
    private var stateImage: some View {
        switch state {
        case .idle, .loading, .loaded:
            Image(state.imageState)
                .resizable()
                .frame(width: 160, height: 160)
                
        case .empty:
            Image(systemName: "tray")
                .font(.system(size: 120))
                .foregroundColor(.secondary)
                
        case .error:
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 120))
                .foregroundColor(.red)
        }
    }
    
    private var shouldShowRetryButton: Bool {
        if case .empty = state { return true }
        if case .error = state { return true }
        return false
    }
}

