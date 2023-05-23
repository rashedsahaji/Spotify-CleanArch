//
//  RecomendedModel.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 13/05/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recomended = try? JSONDecoder().decode(Recomended.self, from: jsonData)

import Foundation

// MARK: - Recomended
struct Recomended: Codable{
    let seeds: [Seed]?
    let tracks: [Track]?
}

// MARK: - Seed
struct Seed: Codable {
    let afterFilteringSize, afterRelinkingSize: Int?
    let href, id: String?
    let initialPoolSize: Int?
    let type: String?
}


// MARK: - AlbumArtist
struct AlbumArtist: Codable {
    let externalUrls: ExternalUrls?
    let href, id, name, type: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}

// MARK: - TrackArtist
struct TrackArtist: Codable {
    let externalUrls: ExternalUrls?
    let followers: Followers?
    let genres: [String]?
    let href, id: String?
    let images: [Image]?
    let name: String?
    let popularity: Int?
    let type, uri: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case followers, genres, href, id, images, name, popularity, type, uri
    }
}

// MARK: - LinkedFrom
struct LinkedFrom: Codable {
}

