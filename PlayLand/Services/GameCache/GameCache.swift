//
//  GameCache.swift
//  PlayLand
//
//  Created by Jonathan Mora on 21/10/25.
//
import Foundation
import Combine

final class GameCache {
    
    static let shared = GameCache()
    private init() {}
    
    private var memoryCache = NSCache<NSString, NSArray>()
    private var lastFetchDate: Date?
    
    private let cacheFileURL: URL = {
        let folder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return folder.appendingPathComponent("games_cache.json")
    }()
    
    private let cacheTTL: TimeInterval = 60 * 60
    
    // MARK: - Guardar cache
    func save(_ games: [ITunesApp]) {
        memoryCache.setObject(games as NSArray, forKey: "gamesCache")
        lastFetchDate = Date()
        saveToDisk(games)
    }
    
    func getGames() -> [ITunesApp]? {
        if let cached = memoryCache.object(forKey: "gamesCache") as? [ITunesApp],
           let last = lastFetchDate,
           Date().timeIntervalSince(last) < cacheTTL {
            return cached
        }
        return loadFromDisk()
    }
    
    // MARK: - Persistencia en disco
    private func saveToDisk(_ games: [ITunesApp]) {
        DispatchQueue.global().async {
            do {
                let data = try JSONEncoder().encode(games)
                try data.write(to: self.cacheFileURL, options: [.atomic])
            } catch {
                print("Error saving cache to disk:", error)
            }
        }
    }
    
    private func loadFromDisk() -> [ITunesApp]? {
        do {
            let data = try Data(contentsOf: cacheFileURL)
            let games = try JSONDecoder().decode([ITunesApp].self, from: data)
            memoryCache.setObject(games as NSArray, forKey: "gamesCache")
            lastFetchDate = Date()
            return games
        } catch {
            return nil
        }
    }
}

