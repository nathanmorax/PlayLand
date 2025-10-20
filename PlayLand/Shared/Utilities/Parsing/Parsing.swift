//
//  Parsing.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import Foundation
import SwiftUI
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, RSSAppError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
