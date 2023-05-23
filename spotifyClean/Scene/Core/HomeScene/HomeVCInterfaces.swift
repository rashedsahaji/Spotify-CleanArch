//
//  HomeInterfaces.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import Foundation
import UIKit

protocol HomeScreenNavigationLogic {
    func navigateToProfile()
    func navigateToAlbumDetailsPage(_ album: Item)
    func navigateToFeaturedPlaylist(_ album: Item)
}

protocol HomeVCBussinesLogic {
    func requestTracks() async
}

protocol HomeVCDisplayLogic: AnyObject {
    func displayTacks(homeVCDataSource: HomeVCDataSource)
}

protocol HomeVCPresentationLogic {
    func presentTracks(sections: [BrowseSectionType])
}

protocol HomVCDataSourceDelegate: AnyObject {
    func selectedAlbum<T>(_ album: T)
}
