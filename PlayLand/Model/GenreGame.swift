//
//  GenreGame.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

enum GameGenre: String, CaseIterable, Identifiable {
    case games = "Games"
    case action = "Action"
    case adventure = "Adventure"
    case arcade = "Arcade"
    case board = "Board"
    case card = "Card"
    case casual = "Casual"
    case educational = "Educational"
    case entertainment = "Entertainment"
    case music = "Music"
    case puzzle = "Puzzle"
    case racing = "Racing"
    case rolePlaying = "Role Playing"
    case simulation = "Simulation"
    case sports = "Sports"
    case strategy = "Strategy"
    case trivia = "Trivia"
    case word = "Word"
    case healthAndFitness = "Health & Fitness"
    
    var id: String { rawValue }
    
    
    var iconGenre: String {
        switch self {
        case .games: return "gamecontroller"          // General
        case .action: return "flame.fill"             // Acción, explosión
        case .adventure: return "figure.walk"         // Exploración
        case .arcade: return "bolt.fill"              // Rápido y arcade
        case .board: return "checkerboard.rectangle" // Juegos de tablero
        case .card: return "suit.club.fill"          // Juegos de cartas
        case .casual: return "smiley.fill"           // Casual y divertido
        case .educational: return "book.fill"        // Educativo
        case .entertainment: return "tv.fill"        // Entretenimiento general
        case .music: return "music.note"             // Juegos musicales
        case .puzzle: return "puzzlepiece.fill"      // Rompecabezas
        case .racing: return "car.fill"              // Carreras
        case .rolePlaying: return "person.fill.turn.right" // RPG / rol
        case .simulation: return "gearshape.fill"    // Simulación / mecánica
        case .sports: return "sportscourt.fill"      // Deportes
        case .strategy: return "brain.head.profile"  // Estrategia
        case .trivia: return "questionmark.circle.fill" // Trivia / preguntas
        case .word: return "textformat"              // Juegos de palabras
        case .healthAndFitness: return "heart.fill"  // Salud y fitness
        }
    }
    
    var colorIconGenre: Color {
        switch self {
        case .games: return .purple
        case .action: return .red
        case .adventure: return .green
        case .arcade: return .yellow
        case .board: return .brown
        case .card: return .pink
        case .casual: return .orange
        case .educational: return .blue
        case .entertainment: return .indigo
        case .music: return .teal
        case .puzzle: return .mint
        case .racing: return .cyan
        case .rolePlaying: return .purple.opacity(0.7)
        case .simulation: return .gray
        case .sports: return .green.opacity(0.7)
        case .strategy: return .blue.opacity(0.7)
        case .trivia: return .orange.opacity(0.7)
        case .word: return .yellow.opacity(0.7)
        case .healthAndFitness: return .red.opacity(0.7)
        }
    }
}
