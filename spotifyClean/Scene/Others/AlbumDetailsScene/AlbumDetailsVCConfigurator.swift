//
//  AlbumDetailsVCConfigurator.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 20/05/23.
//

import Foundation

struct AlbumDetailsVCConfigurator {
    static func createScreen(album: Item) -> AlbumDetailsViewController {
        let vc = AlbumDetailsViewController(album: album)
        let worker = AlbumDetailsWorker(restManager: AlbumRESTManager())
        let interactor = AlbumDetailsVCInteractor()
        interactor.worker = worker
        vc.interactor = interactor
        return vc
    }
}
