//
//  AuthEndPoints.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

private struct AuthConstants {
    static let path = "/authorize"
}

enum AuthEndPoint {
    case login
}

extension AuthEndPoint: EndPoint {
    var queryParams: [URLQueryItem]? {
        [
            URLQueryItem(name: "client_id", value: KeyManager.SecretKeys.clientID.value),
            URLQueryItem(name: "redirect_uri", value: "https://bigohtech.com"),
            URLQueryItem(name: "scope", value: "user-read-private"),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "show_dialog", value: "true")
        ]
    }
    
    var path: String {
        AuthConstants.path
    }
    
    var baseURL: String {
        KeyManager.URLs.authBaseURL.value
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeaders? {
        APIManager.sharedHeaders
    }
    
    
}
