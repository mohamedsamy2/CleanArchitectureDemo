//
//  FavoriteProductsRepositoryProtocol.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 13/02/2024.
//

import Foundation

protocol FavoriteProductsRepositoryProtocol {
    func addProductToFavorites(with id: Int)
    func deleteProductFromFavorites(with id: Int)
    func fetchFavoriteProductIDs() -> [Int]
}
