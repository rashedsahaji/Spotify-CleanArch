//
//  NewReleaseEndPoints.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 12/05/23.
//

import Foundation

private struct AlbumEndPointsConstant {
    static let browseRelease = "/browse/new-releases"
    static let featurePlaylist = "/browse/featured-playlists"
    static let recomended = "/recommendations"
    static let genreSeeds = "/recommendations/available-genre-seeds"
    static let albumDetails = "/albums/{id}"
}

enum AlbumEndPoints {
    case getNewRelease(limit : Int)
    case getFeatured(limit: Int)
    case getRecomended(limit: Int, genre: Set<String>)
    case getGenre
    case getAlbumDetails(id: String)
}

extension AlbumEndPoints: EndPoint {
    var path: String {
        switch self {
        case .getNewRelease(_):
           return AlbumEndPointsConstant.browseRelease
        case .getFeatured(_):
            return AlbumEndPointsConstant.featurePlaylist
        case .getRecomended(_, _):
            return AlbumEndPointsConstant.recomended
        case .getGenre:
            return AlbumEndPointsConstant.genreSeeds
        case .getAlbumDetails(id: let id):
            return AlbumEndPointsConstant.albumDetails.replacingOccurrences(of: "{id}", with: id)
        }
    }
    
    var baseURL: String {
        KeyManager.URLs.apiBaseURL.value
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    }
    
    var queryParams: [URLQueryItem]? {
        switch self {
        case .getNewRelease(let limit):
            return [URLQueryItem(name: "limit", value: "\(limit)")]
        case .getFeatured(let limit):
            return [URLQueryItem(name: "limit", value: "\(limit)")]
        case .getRecomended(limit: let limit, genre: let genre):
            let seeds = genre.joined(separator: ",")
            return [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "seed_genres", value: seeds)]
        case .getGenre:
            return nil
        case .getAlbumDetails(id: _):
            return nil
        }
    }
    
    
}
