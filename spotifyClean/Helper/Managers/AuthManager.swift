//
//  AuthManager.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {
        
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    // MARK: Compiler safe fast access with StaticString
    
    private var accessToken: StaticString? {
        return nil
    }
    
    private var refreshToken: StaticString? {
        return nil
    }
    
    private var tokenExpirationDate: StaticString? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
