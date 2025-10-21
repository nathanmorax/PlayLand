//
//  ContentView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct MainTabView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            NavigationStack(path: $coordinator.path) {
                GameHomeView(coordinator: coordinator)
                    .navigationDestination(for: AppRoute.self) { route in
                        coordinator.build(route: route)
                    }
            }
            .tabItem {
                Label("Game", systemImage: "gamecontroller.fill")
            }
            .tag(AppCoordinator.Tab.apps)
            
            NavigationStack(path: $coordinator.path) {
                VStack {
                    Spacer()
                    Image("coverEmpty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .opacity(0.5)
                    Text("Search view coming soon")
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                    Spacer()
                }
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(AppCoordinator.Tab.search)
        }
    }
}
