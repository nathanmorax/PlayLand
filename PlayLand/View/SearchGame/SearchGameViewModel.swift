//
//  SearchGameViewModel.swift
//  PlayLand
//
//  Created by Jonathan Mora on 21/10/25.
//
import SwiftUI
import Combine


class SearchGameViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [ITunesApp] = []
    @Published var isLoading: Bool = false
    
    private var disposables = Set<AnyCancellable>()
    private let RSSAppFetcher: RSSAppFetcher

    init(RSSAppFetcher: RSSAppFetcher) {
        self.RSSAppFetcher = RSSAppFetcher
    }
    
    func search(term: String) {
        guard !term.isEmpty else {
            results = []
            return
        }
        
        isLoading = true
        
        RSSAppFetcher.searchAppGame(term: term)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    print("Search error:", error)
                }
            } receiveValue: { [weak self] response in
                self?.results = response.results
            }
            .store(in: &disposables)
    }
}

