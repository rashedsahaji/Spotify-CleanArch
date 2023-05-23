//
//  AlbumDetailsVCWorker.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 20/05/23.
//

import Foundation

class AlbumDetailsWorker {
    private var restManager: AlbumRESTManager
    
    init(restManager: AlbumRESTManager) {
        self.restManager = restManager
    }
    
    public func getAlbumDetails(id: String) async -> Item? {
        let albumItems = await restManager.getAlbumDeatils(id: id)
        return albumItems
    }
}
