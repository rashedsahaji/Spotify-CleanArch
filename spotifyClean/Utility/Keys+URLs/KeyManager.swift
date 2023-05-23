//
//  KeyManager.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

class KeyManager {
    private struct Constants {
        static let keysPlist = "Keys"
        static let urlPlist = "URLs"
        static let linkExtentions = "plist"
    }
    
    enum SecretKeys: String {
        var value: String {
            if let linkPath = Bundle.main.path(forResource: Constants.keysPlist, ofType: Constants.linkExtentions) {
                let nsDic = NSDictionary(contentsOfFile: linkPath)!
                let value = nsDic[self.rawValue] as? String
                return value ?? ""
            }
            return ""
        }
        case clientSecret = "CLIENT_SECRET"
        case clientID = "CLIENT_ID"
    }
    
    enum URLs: String {
        var value: String {
            if let linkPath = Bundle.main.path(forResource: Constants.urlPlist, ofType: Constants.linkExtentions) {
                let nsDic = NSDictionary(contentsOfFile: linkPath)!
                let value = nsDic[self.rawValue] as? String
                return value ?? ""
            }
            return ""
        }
        var valueAsURL: URL? {
            if let linkPath = Bundle.main.path(forResource: Constants.urlPlist, ofType: Constants.linkExtentions) {
                let nsDic = NSDictionary(contentsOfFile: linkPath)!
                let value = nsDic[self.rawValue] as? String
                return URL(string: value ?? "")
            }
            return URL(string: "")
        }
        case authBaseURL = "AUTH_BASE_URL"
        case apiBaseURL = "BASE_URL"
    }
}
