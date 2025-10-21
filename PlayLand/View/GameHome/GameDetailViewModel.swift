//
//  GameDetailViewModel.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

struct GameDetailViewModel: Identifiable {
    let itemApp: ITunesApp
    
    var id: String {
        return itemApp.trackId.description
    }
    
    var date: String {
        return itemApp.releaseDate.toMonthYear()
    }
    
    var rating: String {
        return String(format: "%.1f", itemApp.averageUserRating)
    }
    
    var ratingValue: Double {
        return itemApp.averageUserRating
    }
    
}

