//
//  NewReleases.swift
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
struct NewRelease: Codable {
    let albums: Albums?
}

// MARK: - Albums
struct Albums: Codable {
    let href: String?
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let albumType: String?
    let totalTracks: Int?
    let availableMarkets: [String]?
    let externalUrls: ExternalUrls?
    let href, id: String?
    let images: [Image]?
    let name, releaseDate, releaseDatePrecision: String?
    let restrictions: Restrictions?
    let type, uri: String?
    let copyrights: [Copyright]?
    let externalIDS: ExternalIDS?
    let genres: [String]?
    let label: String?
    let popularity: Int?
    let albumGroup: String?
    let artists: [Artist]?

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case totalTracks = "total_tracks"
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case restrictions, type, uri, copyrights
        case externalIDS = "external_ids"
        case genres, label, popularity
        case albumGroup = "album_group"
        case artists
    }
}

// MARK: - Copyright
struct Copyright: Codable {
    let text, type: String?
}

// MARK: - ExternalIDS
struct ExternalIDS: Codable {
    let isrc, ean, upc: String?
}

// MARK: - Restrictions
struct Restrictions: Codable {
    let reason: String?
}
