//
//  AlbumDetailsViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 14/05/23.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    
    private let album: Item
    var interactor: AlbumDetailsVCInteractor?
    
    // Init
    init(album: Item) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
             await interactor?.requrestDetails(id: album.id ?? "")
        }
    }
}
