//
//  UserProfileEndPoints.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import Foundation

private struct UserProfileConstant {
    static let me = "/me"
}

enum UserProfileEndPoint {
    case getProfile
}

extension UserProfileEndPoint : EndPoint {
    var path: String {
        return UserProfileConstant.me
    }
    
    var baseURL: String {
        KeyManager.URLs.apiBaseURL.value
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    }
    
    var queryParams: [URLQueryItem]? {
        nil
    }
}
