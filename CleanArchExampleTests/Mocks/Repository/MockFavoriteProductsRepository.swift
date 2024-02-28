//
//  MockFavoriteProductsRepository.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

import Foundation
@testable import CleanArchExample

class MockFavoriteProductsRepository: FavoriteProductsRepositoryProtocol {
    var addedProductID: Int?
    var deletedProductID: Int?
    var favoriteProductIDs: [Int] = []
    
    func addProductToFavorites(with id: Int) {
        addedProductID = id
    }
    
    func deleteProductFromFavorites(with id: Int) {
        deletedProductID = id
    }

    func fetchFavoriteProductIDs() -> [Int] {
        return favoriteProductIDs
    }
}
