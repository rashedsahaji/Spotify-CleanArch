//
//  GenreModel.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 13/05/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genre = try? JSONDecoder().decode(Genre.self, from: jsonData)

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let genres: [String]?
}

