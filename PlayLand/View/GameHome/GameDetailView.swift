//
//  GameDetailView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct GameDetailView: View {
    let app: ITunesApp
    
    private let viewModel: GameDetailViewModel
    
    init(app: ITunesApp, viewModel: GameDetailViewModel) {
        self.app = app
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                CoverImageAppView(coverImageApp: app.artworkUrl512, size: .large)
                    .stretchy()
                
                CoverImageAppView(coverImageApp: app.artworkUrl100, size: .small)
                    .offset(y: 40)
                    .frame(maxWidth: .infinity)
                
            }
            .padding(.bottom, 50)
            
            VStack(alignment: .center, spacing: 8) {
                
                descriptionApp
                    .frame(maxWidth: .infinity)
                
                Spacer().frame(height: 16)
                
                attributesApp
                    .padding()
                    .frame(height: 66)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(22)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                
                screenshotsApp
                
            }
            
            .frame(maxWidth: .infinity)
            .padding(.top, 8)
            .padding(.horizontal, 24)
            
            
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
    }
    
    private func starType(for index: Int) -> String {
        let rating = viewModel.ratingValue
        if rating >= Double(index + 1) {
            return "star.fill"
        } else if rating > Double(index) && rating < Double(index + 1) {
            return "star.leadinghalf.fill"
        } else {
            return "star"
        }
    }
    
    
    
    @ViewBuilder
    var descriptionApp: some View {
        
        Text(app.trackName)
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
        
        Text(app.artistName)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
        
        if let description = app.description {
            ExpandableText(text: description, lineLimit: 5)
        }
    }
    
    var attributesApp: some View {
        HStack(spacing: 8) {
            ForEach(0..<5) { index in
                Image(systemName: starType(for: index))
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blue)
                    .frame(width: 12, height: 12)
            }
            
            Text(viewModel.rating)
                .bold()
            
            Spacer()
            
            Text(app.trackContentRating)
            
            Spacer()
            
            Text(viewModel.date)
        }
    }
    
    var screenshotsApp: some View {
        HStack {
            if !app.screenshotUrls.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Screenshots")
                        .font(.headline)
                        .padding(.horizontal, 4)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(app.screenshotUrls, id: \.self) { urlString in
                                
                                CoverImageAppView(coverImageApp: urlString, size: .large)
                                    .cornerRadius(8, corners: .allCorners)
                                
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                }
                .padding(.top, 16)
            }
        }
    }
}


struct ExpandableText: View {
    let text: String
    let lineLimit: Int
    
    @State private var expanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .animation(.easeInOut, value: expanded)
            
            Button(action: {
                expanded.toggle()
            }) {
                Text(expanded ? "Ver menos" : "Ver más")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
        }
    }
}
