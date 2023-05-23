//
//  HomeVCPresenter.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 14/05/23.
//

import Foundation

class HomeVCPresenter: HomeVCPresentationLogic {
    weak var viewController: HomeVCDisplayLogic?
    
    func presentTracks(sections: [BrowseSectionType]) {
        let dataSource = HomeVCDataSource(sections: sections)
        viewController?.displayTacks(homeVCDataSource: dataSource)
    }
}
