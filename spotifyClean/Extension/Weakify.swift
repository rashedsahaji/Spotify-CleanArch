//
//  Weakify.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

protocol Weakifiable: AnyObject { }

extension NSObject: Weakifiable { }

extension Weakifiable {
    func weakify<T>(_ code: @escaping (Self, T) -> Void) -> (T) -> Void {
        return {
            /* Begin boilerplate */
            [weak self] (data) in
            
            guard let self = self else { return }
            /* End boilerplate */
            
            code(self, data)
        }
    }
}
