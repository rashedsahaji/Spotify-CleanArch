//
//  AuthInterfaces.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

protocol AuthSuccessDelegate: AnyObject {
    func tokenSavedSuccessfully(result: Bool)
}

protocol AuthRoutingLogic {
    func navigateToHome()
}
