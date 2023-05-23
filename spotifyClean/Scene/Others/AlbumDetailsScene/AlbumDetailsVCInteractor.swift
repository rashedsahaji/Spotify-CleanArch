//
//  AlbumDetailsVCInteractor.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 20/05/23.
//

import Foundation

class AlbumDetailsVCInteractor : AlbumDetailsBusinessLogic {
    
    // MARK: - Properties
    var worker: AlbumDetailsWorker?
    var presenter: AlbumDetailsPresentationLogic?
    
    func requrestDetails(id: String) async {
        guard let worker else { return }
        guard let item = await worker.getAlbumDetails(id: id) else {return}
        debugPrint(item.name ?? "")
        presenter?.presentAlbumDetails(item)
    }
}
