//
//  AlbumRESTManager.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 12/05/23.
//

import Foundation

actor AlbumRESTManager {
    // MARK: - New Releases
    public func getNewRelease(limit: Int) async -> NewRelease? {
        do  {
            let reponse = try await APIManager.shared.getData(from: AlbumEndPoints.getNewRelease(limit: limit))
            let result = try JSONDecoder().decode(NewRelease.self, from: reponse.data)
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
    // MARK: - Featured Playlist
    public func getFeaturedPlaylist(limit: Int) async -> FeaturedPlayList? {
         do  {
             let reponse = try await APIManager.shared.getData(from: AlbumEndPoints.getFeatured(limit: limit))
             let result = try JSONDecoder().decode(FeaturedPlayList.self, from: reponse.data)
             return result
         } catch {
             debugPrint(error)
         }
         return nil
     }
    // MARK: - Recomendeds
    public func getRecomended(genres: Set<String>, limit: Int) async -> Recomended? {
         do  {
             let reponse = try await APIManager.shared.getData(from: AlbumEndPoints.getRecomended(limit: limit, genre: genres))
             let result = try JSONDecoder().decode(Recomended.self, from: reponse.data)
             return result
         } catch {
             debugPrint(error)
         }
         return nil
     }
    public func getRecomendedGenre() async -> Genre? {
         do  {
             let reponse = try await APIManager.shared.getData(from: AlbumEndPoints.getGenre)
             let result = try JSONDecoder().decode(Genre.self, from: reponse.data)
             return result
         } catch {
             debugPrint(error)
         }
         return nil
     }
    
    // MARK: - Album Details
    
    public func getAlbumDeatils(id: String) async -> Item? {
        do {
            let response = try await APIManager.shared.getData(from: AlbumEndPoints.getAlbumDetails(id: id))
            let result = try JSONDecoder().decode(Item.self, from: response.data)
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
