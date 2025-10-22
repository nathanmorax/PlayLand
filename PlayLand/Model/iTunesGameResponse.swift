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

struct ITunesApp: Decodable, Identifiable, Hashable {
    let trackId: Int
    let trackName: String
    let artistName: String
    let price: Double
    let description: String?
    let releaseNotes: String?
    let currency: String
    let primaryGenreName: String
    let screenshotUrls: [String]
    let releaseDate: String
    let genres: [String]
    let genreIds: [String]
    let artworkUrl100: String
    let artworkUrl512: String
    let trackViewUrl: String
    let userRatingCount: Int
    let averageUserRating: Double
    let trackContentRating: String
    
    var id: Int { trackId }
}
