//
//  HomeVCInteractor.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 14/05/23.
//

import Foundation

enum BrowseSectionType {
    case newRelease(viewModels: [NewReleaseCellViewModel])
    case feturedPlaylist(viewModels: [FeaturedPlaylistCellViewModel])
    case recomededTracks(viewModels: [RecomendedTrackCellViewModel])
}

class HomeVCInteractor: HomeVCBussinesLogic {
    
    var worker: HomeVCWorker?
    var presenter: HomeVCPresentationLogic?
    
    var sections = [BrowseSectionType]()
    
    func requestTracks() async {
        guard let worker else {return}
        let recomended = await worker.fetchRecomended(limit: 20)
        let newRelease = await worker.fetchNewRelease(limit: 20)
        let feturedPlaylist = await worker.fetchFeaturedPlayList(limit: 20)
        
        guard let recomendedTraks = recomended?.tracks,
              let newReleaseAlbumItems = newRelease?.albums?.items,
              let featuredPlayListItems = feturedPlaylist?.playlists?.items else {return}
        self.configModel(recomendedTraks: recomendedTraks, newReleaseAlbumItems: newReleaseAlbumItems, featuredPlayListItems: featuredPlayListItems)
    }
    
    private func configModel(recomendedTraks: [Track], newReleaseAlbumItems: [Item], featuredPlayListItems: [Item]) {
        
        // MARK: - Handle New Releases for CollectionView Cells
        sections.append(.newRelease(viewModels: newReleaseAlbumItems.compactMap({
            return NewReleaseCellViewModel(
                id: $0.id ?? "",
                name: $0.name ?? "",
                artWorkURL: $0.images?.first?.url ?? "",
                numberOfTracks: $0.totalTracks ?? 0,
                artistname: $0.artists?.first?.name ?? "-",
                item: $0
            )
        })))
        
        // MARK: - Handle Featured Playlist for CollectionView Cells
        sections.append(.feturedPlaylist(viewModels: featuredPlayListItems.compactMap({
            return FeaturedPlaylistCellViewModel(name: $0.name ?? "", artWorkURL: $0.images?.first?.url ?? "", item: $0)
        })))
        
        // MARK: - Handle Recomended
        
        sections.append(.recomededTracks(viewModels: recomendedTraks.compactMap({
            return RecomendedTrackCellViewModel(name: $0.name ?? "", artWorkURL: $0.album?.images?.first?.url ?? "", artistname: $0.artists?.first?.name ?? "", track: $0)
        })))
        
        // MARK: - Present it ViewController
        presenter?.presentTracks(sections: sections)
    }
}
