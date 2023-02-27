//
//  UserManager.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

final class UserManager {
    static let shared = UserManager()
    
    private struct Constants {
        static let accessTokenKEY = "USERACCESSTOKEN"
        static let refreshTokenKEY = "USERREFRESHTOKEN"
        static let expirationDate = "TOKENEXPIRATIONDATE"
    }
    
    var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.accessTokenKEY)
        } set {
            UserDefaults.standard.set(newValue, forKey: Constants.accessTokenKEY)
        }
    }
    
    var refreshToken: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.refreshTokenKEY)
        } set {
            UserDefaults.standard.set(newValue, forKey: Constants.refreshTokenKEY)
        }
    }
    
    var expirationDate: Date? {
        get {
            return UserDefaults.standard.object(forKey: Constants.expirationDate) as? Date
        } set {
            UserDefaults.standard.set(newValue, forKey: Constants.expirationDate)
        }
    }
}
