//
//  ContentView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 18/10/25.
//

import SwiftUI
import Combine

struct GameHomeView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    @StateObject var vm:  GameHomeViewModel
    @State private var selectedGenre: GameGenre? = nil
    
    
    init(coordinator: AppCoordinator, vm: GameHomeViewModel = GameHomeViewModel(RSSAppFetcher: RSSAppFetcher())) {
        self.coordinator = coordinator
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
           ZStack {
               Color.background.ignoresSafeArea(edges: .all)
               
               VStack {
                   contentView
               }
           }
           .task {
               vm.loadGame()
           }
       }
    
    @ViewBuilder
     private var contentView: some View {
         if vm.loadingState == .loaded {
             loadedContentView
         } else {
             StateUIView(state: vm.loadingState, onRetry: {})
         }
     }
    
    private var loadedContentView: some View {
         ScrollView {
             VStack(spacing: 24) {
                 FeaturedGameView()
                 
                 GameGenreButton(selectedGenre: $selectedGenre)
                     .onChange(of: selectedGenre) {
                         if let genre = selectedGenre {
                             vm.filter(by: genre)
                             coordinator.navigate(to: .appsGenre(genre: genre, apps: vm.filteredGames))
                         }
                     }
                 
                 GameSectionView(title: "Most Played", games: vm.mostPlayed, coordinator: coordinator)
                 GameSectionView(title: "Top Rated", games: vm.topRated, coordinator: coordinator)
             }
             .padding()
         }
         .navigationTitle("Game")
     }
}


#Preview {
    GameHomeView(coordinator: AppCoordinator(), vm: GameHomeViewModel(RSSAppFetcher: RSSAppFetcher()))
}
