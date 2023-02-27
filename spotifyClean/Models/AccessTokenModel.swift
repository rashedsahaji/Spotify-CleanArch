// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? JSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct AuthTokenModel: Codable {
    let accessToken: String?
    let expiresIn: Int
    let refreshToken, scope, tokenType: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
        case tokenType = "token_type"
    }
}
