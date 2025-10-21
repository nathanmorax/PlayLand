//
//  LoadingState.swift
//  PlayLand
//
//  Created by Jonathan Mora on 21/10/25.
//

enum LoadingState: Equatable {
    case idle
    case loading
    case loaded
    case empty
    case error(String)
    
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
    
    var imageState: String {
        switch self {
        case .idle, .loading, .loaded, .empty, .error: return "coverEmpty"
        }
    }
    
    var messageState : String {
     switch self {
     case .idle, .loading: return "Loading games..."
     case .loaded: return "Games loaded"
     case .empty: return "No Games Available"
     case .error: return "Failed to load games. Please try again."
        }
    }
}
