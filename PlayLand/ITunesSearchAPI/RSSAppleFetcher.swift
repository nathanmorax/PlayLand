//
//  RSSAppleFetcher.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//

import Foundation
import Combine

enum RSSAppError: Error {
    case parsing(description: String)
    case network(description: String)
}

protocol RSSAppFetchable {
    func mostPlayed() -> AnyPublisher<ITunesSearchResponse, RSSAppError>
}


class RSSAppFetcher {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
}

extension RSSAppFetcher: RSSAppFetchable {
    
    func mostPlayed() -> AnyPublisher<ITunesSearchResponse, RSSAppError> {
        
        return RSSApppFetch(with: makeTopPaidGamesComponents())
    }
    
    private func RSSApppFetch<T>(with components: URLComponents) -> AnyPublisher<T, RSSAppError> where T: Decodable {
        guard let url = components.url else {
            let error = RSSAppError.network(description: "Invalid URL components")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                    .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}

private extension RSSAppFetcher {
    
    struct AppleRSSAPI {
        static let scheme = "https"
        static let host = "itunes.apple.com"
        static let basePath = "/search"
    }
    
    func makeTopPaidGamesComponents(term: String = "games",
                                   country: String = "US",
                                   limit: Int = 50) -> URLComponents {
        var components = URLComponents()
        components.scheme = AppleRSSAPI.scheme
        components.host = AppleRSSAPI.host
        components.path = AppleRSSAPI.basePath
        components.queryItems = [
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "media", value: "software"),
            URLQueryItem(name: "entity", value: "software"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]
        return components
    }
}
