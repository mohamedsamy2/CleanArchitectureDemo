//
//  MockFavoriteProductsLocalDataSource.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

import Foundation
@testable import CleanArchExample
class MockFavoriteProductsLocalDataSource: FavoriteProductsLocalDataSourceProtocol {
    var favoriteProductIDs: [Int] = []
    
    func addProductToFavorites(with id: Int) {
        if !favoriteProductIDs.contains(id) {
            favoriteProductIDs.append(id)
        }
    }
    
    func deleteProductFromFavorites(with id: Int) {
        if let index = favoriteProductIDs.firstIndex(of: id) {
            favoriteProductIDs.remove(at: index)
        }
    }
    
    func fetchFavoriteProductIDs() -> [Int] {
        return favoriteProductIDs
    }
}
