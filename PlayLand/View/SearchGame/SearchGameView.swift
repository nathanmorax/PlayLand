//
//  SearchGameView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 21/10/25.
//
import SwiftUI
import Combine

struct SearchGameView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    @StateObject var vm: SearchGameViewModel
    
    init(coordinator: AppCoordinator, vm: SearchGameViewModel = SearchGameViewModel(RSSAppFetcher: RSSAppFetcher())) {
        self.coordinator = coordinator
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ScrollView {
                LazyVStack(spacing: 22) {
                    if vm.query.isEmpty {
                        VStack(spacing: 24) {
                            Spacer()

                            CoverImageAppView(coverImageApp: "coverEmpty", size: .small)
                                .frame(maxWidth: .infinity)
                            
                            Text("What will you play today?")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            Spacer()

                        }
                    } else {
                        ForEach(vm.results) { game in
                            GameRowView(game: game, coordinator: coordinator)
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Search Games")
            .searchable(text: $vm.query, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: vm.query) { newValue, _ in
                vm.search(term: newValue)
            }
        }
    }
}


