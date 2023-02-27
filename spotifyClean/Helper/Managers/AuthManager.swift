//
//  AuthManager.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

actor AuthManager {
    static let shared = AuthManager()
    
    private var refreshingToken = false
    
    private init() {
        
    }
    
   nonisolated var isSignedIn: Bool {
       return accessToken != nil
    }
    
   nonisolated private var accessToken: String? {
        return UserManager.shared.accessToken
    }
    
    private var refreshToken: String? {
        return UserManager.shared.refreshToken
    }
    
    private var tokenExpirationDate: Date? {
        return UserManager.shared.expirationDate
    }
    
    private var shouldRefreshToken: Bool {
        guard let expirationDate = tokenExpirationDate else {return false}
        let currentData = Date()
        let interval: TimeInterval = 300
        return currentData.addingTimeInterval(interval) >= expirationDate
    }
    
    public func exchangeCodeForToken(code: String) async -> Bool {
        do {
            let response: APIResponse = try await APIManager.shared.getData(from: AuthEndPoint.token(code: code))
            if 200 ... 299 ~= response.statusCode {
                let json = try JSONDecoder().decode(AuthTokenModel.self, from: response.data)
                cacheToken(result: json)
                return true
            }
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        return false
    }
    
    private var onRrefreshBlock = [((String) -> Void)]()
    
    public func refreshAccessToken() async -> Bool {
        if !refreshingToken {
            guard shouldRefreshToken else {return true}
            guard let refreshToken else {return false}
            
            do {
                refreshingToken = true
                let response: APIResponse = try await APIManager.shared.getData(from: AuthEndPoint.refreshToken(refreshToken: refreshToken))
                if 200 ... 299 ~= response.statusCode {
                    let json = try JSONDecoder().decode(AuthTokenModel.self, from: response.data)
                    cacheToken(result: json)
                    refreshingToken = false
                    return true
                }
            } catch {
                refreshingToken = false
                debugPrint(error.localizedDescription)
                return false
            }
        }
        return false
    }
    
    public func withValidToken() async -> String {
        
        if shouldRefreshToken {
            let needRefresh = await refreshAccessToken()
            if needRefresh, let token = self.accessToken {
                return token
            }
        } else if let accessToken {
            return accessToken
        }
        
        return ""
    }
    
    private func cacheToken(result: AuthTokenModel) {
        UserManager.shared.accessToken = result.accessToken
        UserManager.shared.expirationDate = Date().addingTimeInterval(TimeInterval(result.expiresIn))
        guard let refresh = result.refreshToken else {return}
        UserManager.shared.refreshToken = refresh
    }
}
