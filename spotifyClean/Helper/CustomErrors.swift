//
//  CustomErrors.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

enum CustomErrors: Error  {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

extension CustomErrors: LocalizedError {
    public var errorDescription: String? {
        return nil
    }
}
