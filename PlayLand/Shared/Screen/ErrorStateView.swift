//
//  ErrorStateView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct ErrorStateView: View {
    let messageState: String
    let imageState: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(imageState)
                .frame(width: 120, height: 120)
                .foregroundColor(.red)
            
            Text(messageState)
                .font(.title2)
                .fontWeight(.semibold)
            
            Button(action: {
                //vm.retry()
            }) {
                Label("Try Again", systemImage: "arrow.clockwise")
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 8)
        }
    }
}
