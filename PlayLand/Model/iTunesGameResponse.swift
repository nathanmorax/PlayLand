//
//  iTunesGameResponse.swift
//  PlayLand
//
//  Created by Jonathan Mora on 19/10/25.
//

struct ITunesSearchResponse: Decodable {
    let resultCount: Int
    let results: [ITunesApp]
}

// MARK: - App individual
struct ITunesApp: Decodable, Identifiable, Hashable {
    let trackId: Int
    let trackName: String
    let artistName: String
    let price: Double
    let currency: String
    let primaryGenreName: String
    let genres: [String]
    let genreIds: [String]
    let artworkUrl100: String
    let trackViewUrl: String
    let userRatingCount: Int
    let averageUserRating: Double
    
    var id: Int { trackId }
}
