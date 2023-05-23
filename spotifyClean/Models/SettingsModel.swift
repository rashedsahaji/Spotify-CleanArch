//
//  SettingsModel.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
