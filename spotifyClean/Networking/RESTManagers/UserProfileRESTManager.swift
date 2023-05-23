//
//  UserProfileRESTManager.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import Foundation

actor UserProfileRESTManager {
    func getUserProfile() async -> UserProfile? {
        do {
            let response: APIResponse = try await APIManager.shared.getData(from: UserProfileEndPoint.getProfile)
            let result = try JSONDecoder().decode(UserProfile.self, from: response.data)
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
