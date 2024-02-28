//
//  ProductDetailsLocalDataSource.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 12/02/2024.
//

import Foundation

class FavoriteProductsLocalDataSource: FavoriteProductsLocalDataSourceProtocol {
    
    // Method to add a product ID to favorites in UserDefaults
    func addProductToFavorites(with id: Int) {
        var favorites = fetchFavoriteProductIDs()
        if !favorites.contains(id) {
            favorites.append(id)
            UserDefaults.standard.set(favorites, forKey: Constants.UserDefaultsKeys.favoriteProducts)
        }
    }
    
    // Method to delete a product ID from favorites in UserDefaults
    func deleteProductFromFavorites(with id: Int) {
        var favorites = fetchFavoriteProductIDs()
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: Constants.UserDefaultsKeys.favoriteProducts)
        }
    }

    // Method to fetch the list of favorite product IDs from UserDefaults
    func fetchFavoriteProductIDs() -> [Int] {
        if let favorites = UserDefaults.standard.array(forKey: Constants.UserDefaultsKeys.favoriteProducts) as? [Int] {
            return favorites
        } else {
            return []
        }
    }
}

protocol FavoriteProductsLocalDataSourceProtocol {
    func addProductToFavorites(with id: Int)
    func deleteProductFromFavorites(with id: Int)
    func fetchFavoriteProductIDs() -> [Int]
}
