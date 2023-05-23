//
//  HomeConfigurator.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import Foundation
import UIKit

struct HomeConfigurator {
    static func createScreen () -> HomeViewController {
        let home = HomeViewController()
        let router = HomeVCRouter()
        let restManager = AlbumRESTManager()
        let worker = HomeVCWorker(restManager: restManager)
        let interactor = HomeVCInteractor()
        let presenter = HomeVCPresenter()
        router.viewController = home
        home.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = home
        home.router = router
        return home
    }
}
