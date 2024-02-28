//
//  FavoriteProductsRepository.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 13/02/2024.
//

import Foundation

class FavoriteProductsRepository: FavoriteProductsRepositoryProtocol {
    
    private let localDataSource: FavoriteProductsLocalDataSourceProtocol
    
    init(localDataSource: FavoriteProductsLocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }
    
    // Method to add a product ID to favorites in UserDefaults
    func addProductToFavorites(with id: Int) {
        localDataSource.addProductToFavorites(with: id)
    }
    
    // Method to delete a product ID from favorites in UserDefaults
    func deleteProductFromFavorites(with id: Int) {
        localDataSource.deleteProductFromFavorites(with: id)
    }

    // Method to fetch the list of favorite product IDs from UserDefaults
    func fetchFavoriteProductIDs() -> [Int] {
        localDataSource.fetchFavoriteProductIDs()
    }
}

