//
//  UserProfileModel.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? JSONDecoder().decode(UserProfile.self, from: jsonData)

import Foundation

// MARK: - UserProfile
struct UserProfile: Codable, Identifiable {
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return true
    }
    let uid: UUID = UUID()
    let country, displayName, email: String?
    let explicitContent: ExplicitContent?
    let externalUrls: ExternalUrls?
    let followers: Followers?
    let href: String?
    let id: String?
    let images: [Image]?
    let product, type, uri: String?

    enum CodingKeys: String, CodingKey {
        case country
        case displayName = "display_name"
        case email
        case explicitContent = "explicit_content"
        case externalUrls = "external_urls"
        case followers, href, id, images, product, type, uri
    }
}

// MARK: - ExplicitContent
struct ExplicitContent: Codable {
    let filterEnabled, filterLocked: Bool?

    enum CodingKeys: String, CodingKey {
        case filterEnabled = "filter_enabled"
        case filterLocked = "filter_locked"
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    let spotify: String?
}

// MARK: - Followers
struct Followers: Codable {
    let href: String?
    let total: Int?
}

// MARK: - Image
struct Image: Codable {
    let height: Int?
    let url: String?
    let width: Int?
}
