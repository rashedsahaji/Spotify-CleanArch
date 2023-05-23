//
//  HomeVCWorker.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 14/05/23.
//

import Foundation

class HomeVCWorker {
    
    var restManager: AlbumRESTManager
    
    init(restManager: AlbumRESTManager) {
        self.restManager = restManager
    }
    
    // MARK: - Fetch Recomended
    func fetchRecomended(limit: Int) async -> Recomended? {
        let genres = await restManager.getRecomendedGenre()?.genres
        guard let genres else {return nil}
        var seeds = Set<String>()
        while seeds.count < 5 {
            if let random = genres.randomElement() {
                seeds.insert(random)
            }
        }
        // MARK: Fetch Recomended using random genres
        let recomendedTracks = await restManager.getRecomended(genres: seeds, limit: limit)
        return recomendedTracks
    }
    
    // MARK: - Fetch New Releases
    func fetchNewRelease(limit: Int) async -> NewRelease? {
        let newReleases = await  restManager.getNewRelease(limit: limit)
        return newReleases
    }
    
    // MARK: - Fetch Featured Playlist
    func fetchFeaturedPlayList(limit: Int) async -> FeaturedPlayList? {
        let featuredPlayList = await  restManager.getFeaturedPlaylist(limit: limit)
        return featuredPlayList
    }
}
