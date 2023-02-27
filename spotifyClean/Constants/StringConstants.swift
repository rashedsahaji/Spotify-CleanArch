//
//  StringConstants.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 25/02/23.
//

import Foundation

class LocalizedStrings {
    enum TabBarVC: String {
        var localized: String {
            return self.rawValue.localized
        }
        case home = "TabBar/Home"
        case search = "TabBar/Search"
        case library = "TabBar/Library"
    }
    
    enum ScreenTitle: String {
        var localized: String {
            return self.rawValue.localized
        }
        case singIn = "ScreenTitles/sigin"
    }
    
    enum WelcomeScreen: String {
        var localized: String {
            return self.rawValue.localized
        }
        case buttonTitle = "WelcomeScreen/buttonTitle"
    }
}
