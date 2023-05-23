//
//  FeaturePlaylistModel.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 12/05/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newRelease = try? JSONDecoder().decode(NewRelease.self, from: jsonData)

import Foundation

// MARK: - NewRelease
struct FeaturedPlayList: Codable {
    let message: String?
    let playlists: Playlists?
}

// MARK: - Playlists
struct Playlists: Codable {
    let href: String?
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
    let items: [Item]?
    let owner: Owner?
    let name: String?
}


