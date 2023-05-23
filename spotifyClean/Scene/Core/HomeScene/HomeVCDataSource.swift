//
//  HomeVCDataSource.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 13/05/23.
//

import Foundation
import UIKit

class HomeVCDataSource : NSObject {
    
    // MARK: - Properties
    var sections: [BrowseSectionType]
    weak var delegate: HomVCDataSourceDelegate?
    
    init(sections: [BrowseSectionType]) {
        self.sections = sections
    }
}

extension HomeVCDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case .newRelease(viewModels: let viewModel):
            return viewModel.count
        case .feturedPlaylist(viewModels: let viewModel):
            return viewModel.count
        case .recomededTracks(viewModels: let viewModel):
            return viewModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let type = sections[indexPath.section]
        
        switch type {
        case .newRelease(viewModels: let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewReleaseCollectionViewCell.identifier, for: indexPath
            ) as? NewReleaseCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        case .feturedPlaylist(viewModels: let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier, for: indexPath
            ) as? FeaturedPlaylistCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        case .recomededTracks(viewModels: let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomendedTrackCollectionViewCell.identifier, for: indexPath
            ) as? RecomendedTrackCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
}

extension HomeVCDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = sections[indexPath.section]
        switch type {
        case .newRelease(viewModels: let viewModel):
            let album = viewModel[indexPath.row]
            delegate?.selectedAlbum(album)
        case .feturedPlaylist(viewModels: let viewModel):
            let album = viewModel[indexPath.row]
            delegate?.selectedAlbum(album)
        case .recomededTracks:
            return
        }
    }
}
