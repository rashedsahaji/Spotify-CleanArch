//
//  AuthEndPoints.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

private struct AuthConstants {
    static let auth = "/authorize"
    static let token = "/api/token"
}

enum AuthEndPoint {
    case login
    case token(code : String)
    case refreshToken(refreshToken: String)
}

extension AuthEndPoint: EndPoint {
    var queryParams: [URLQueryItem]? {
        switch self {
        case .login:
            return         [
                URLQueryItem(name: "client_id", value: KeyManager.SecretKeys.clientID.value),
                URLQueryItem(name: "redirect_uri", value: "https://bigohtech.com"),
                URLQueryItem(name: "scope", value: "user-read-private playlist-modify-public playlist-modify-private playlist-read-private playlist-read-collaborative user-library-modify user-library-read user-read-email"),
                URLQueryItem(name: "response_type", value: "code"),
                URLQueryItem(name: "show_dialog", value: "true")
            ]
        case .token(let code):
            return [
                URLQueryItem(name: "grant_type", value: "authorization_code"),
                URLQueryItem(name: "code", value: code),
                URLQueryItem(name: "redirect_uri", value: "https://bigohtech.com")
            ]
        case .refreshToken(let token):
            return [
                URLQueryItem(name: "grant_type", value: "refresh_token"),
                URLQueryItem(name: "refresh_token", value: token),
            ]
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return AuthConstants.auth
        case .token, .refreshToken:
            return AuthConstants.token
        }
    }
    
    var baseURL: String {
        KeyManager.URLs.authBaseURL.value
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .login:
            return .get
        case .token:
            return .post
        case .refreshToken:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return APIManager.sharedHeaders
        case .token, .refreshToken:
            let basicToken = KeyManager.SecretKeys.clientID.value+":"+KeyManager.SecretKeys.clientSecret.value
            let data = basicToken.data(using: .utf8)
            guard let base64String = data?.base64EncodedString() else {return ["":""]}
            return [
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization" : "Basic \(base64String)"
            ]
        }
        
    }
}
