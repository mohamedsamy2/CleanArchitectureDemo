//
//  AddProductToFavoritesUseCase.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 13/02/2024.
//

import Foundation

class AddProductToFavoritesUseCase: AddProductToFavoritesUseCaseProtocol {
    private let repository: FavoriteProductsRepositoryProtocol
    
    init(repository: FavoriteProductsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with id: Int) {
        repository.addProductToFavorites(with: id)
        print("Product added to favorites")
    }
}


protocol AddProductToFavoritesUseCaseProtocol {
    func execute(with id: Int)
}
