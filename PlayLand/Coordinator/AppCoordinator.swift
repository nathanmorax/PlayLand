//
//  AppCoordinator.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI
import Foundation
import Combine

enum AppRoute: Hashable {
    case appsGenre(genre: GameGenre, apps: [ITunesApp])
    case search
    case appDetail(app: ITunesApp)
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: Tab = .apps
    
    enum Tab {
        case apps
        case search
    }
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func switchTab(to tab: Tab) {
        selectedTab = tab
    }
}

extension AppCoordinator {
    @ViewBuilder
    func build(route: AppRoute) -> some View {
        switch route {
        case .appDetail(let app):
            let viewModel = GameDetailViewModel(itemApp: app)
            GameDetailView(app: app, viewModel: viewModel)
        case .appsGenre(let genre, let apps):
            GameListView(genre: genre, games: apps, coordinator: self)
            
        default:
            EmptyView()
        }
    }
}



