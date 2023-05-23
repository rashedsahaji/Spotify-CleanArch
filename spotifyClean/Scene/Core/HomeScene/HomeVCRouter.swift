//
//  HomeRouter.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import Foundation
import UIKit

class HomeVCRouter: NSObject, HomeScreenNavigationLogic {
    func navigateToAlbumDetailsPage(_ album: Item) {
        let albumDetails = AlbumDetailsVCConfigurator.createScreen(album: album)
        albumDetails.title = album.name ?? ""
        albumDetails.navigationItem.largeTitleDisplayMode = .never
        viewController?.navigationController?.pushViewController(albumDetails, animated: true)
    }
    
    func navigateToFeaturedPlaylist(_ album: Item) {
        let albumDetails = PlaylistVCConfigurator.createScreen(album)
        albumDetails.title = album.name ?? ""
        albumDetails.navigationItem.largeTitleDisplayMode = .never
        viewController?.navigationController?.pushViewController(albumDetails, animated: true)
    }
    
    func navigateToProfile() {
        let vc = SettingConfigurator.createScreen()
        vc.navigationItem.largeTitleDisplayMode = .never
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    weak var viewController: HomeViewController?
    
}
