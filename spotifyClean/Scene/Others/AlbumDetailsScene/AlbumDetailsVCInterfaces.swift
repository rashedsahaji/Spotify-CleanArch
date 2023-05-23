//
//  AlbumDetailsVCInterfaces.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 20/05/23.
//

import Foundation

protocol AlbumDetailsBusinessLogic {
    func requrestDetails(id: String) async
}

protocol AlbumDetailsPresentationLogic {
    func presentAlbumDetails(_ album: Item)
}

protocol AlbumDetailsVCDisplayLogic: AnyObject {
    func displayTacks(AlbumDetailsVCDataSource: AlbumDetailsVCDataSource)
}
