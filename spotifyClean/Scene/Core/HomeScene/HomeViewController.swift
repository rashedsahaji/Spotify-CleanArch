//
//  HomeViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 25/02/23.
//

import UIKit
import Foundation

class HomeViewController: UIViewController{
    
    // MARK: - Properties
    var router: HomeScreenNavigationLogic?
    var dataSource: HomeVCDataSource?
    var interactor: HomeVCBussinesLogic?

    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        view.addSubview(spinner)
        Task {
            await interactor?.requestTracks()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - Components
    internal var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
        return createSectionLayout(section: sectionIndex)
     })
    
    private let spinner: UIActivityIndicatorView = {
        let spinnner = UIActivityIndicatorView()
        spinnner.tintColor = .label
        spinnner.hidesWhenStopped = true
        return spinnner
    }()
}

// MARK: - UISetup
extension HomeViewController {
    private func setupNavigationBar() {
        title = "Browse"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapOnGear))
    }
    
     @objc private func didTapOnGear() {
        guard let router else {return}
        router.navigateToProfile()
    }
    
    private static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        
        switch section {
        case 0:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1.0)
                    )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            // Vertical Group in Horizontal Group
            
            let vGroup = NSCollectionLayoutGroup.vertical(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(390)),
                subitem: item,
                count: 3
            )
            let hGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.9),
                        heightDimension: .absolute(390)),
                subitem: vGroup,
                count: 1
            )
            
            // Section
            let section = NSCollectionLayoutSection(group: hGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 1:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .absolute(200),
                        heightDimension: .absolute(200)
                    )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            // Group
            
            let vGroup = NSCollectionLayoutGroup.vertical(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .absolute(200),
                        heightDimension: .absolute(400)),
                subitem: item,
                count: 2
            )
            
            let hGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .absolute(200),
                        heightDimension: .absolute(400)),
                subitem: vGroup,
                count: 1
            )
            
            // Section
            let section = NSCollectionLayoutSection(group: hGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 2:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1.0)
                    )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
           //Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(80)),
                subitem: item,
                count: 1
            )
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            
            return section
            
        default:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1.0)
                    )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            // Vertical Group in Horizontal Group
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize:
                    NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(390)),
                subitem: item,
                count: 1
            )
           
            // Section
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
        
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(NewReleaseCollectionViewCell.self, forCellWithReuseIdentifier: NewReleaseCollectionViewCell.identifier)
        collectionView.register(RecomendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: RecomendedTrackCollectionViewCell.identifier)
        collectionView.register(FeaturedPlaylistCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
    }
}

extension HomeViewController: HomeVCDisplayLogic {
    func displayTacks(homeVCDataSource: HomeVCDataSource) {
        DispatchQueue.main.async {
            self.dataSource = homeVCDataSource
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self.dataSource
            self.dataSource?.delegate = self
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: HomVCDataSourceDelegate {
    func selectedAlbum<T>(_ album: T) {
        if let album = album as? NewReleaseCellViewModel {
            router?.navigateToAlbumDetailsPage(album.item)
        } else if let playlist = album as? FeaturedPlaylistCellViewModel {
            router?.navigateToFeaturedPlaylist(playlist.item)
        }
    }
    
}
