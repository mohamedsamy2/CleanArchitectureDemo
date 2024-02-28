//
//  DeleteProductFromFavoritesUseCase.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 13/02/2024.
//

import Foundation

class DeleteProductFromFavoritesUseCase: DeleteProductFromFavoritesUseCaseProtocol {
    private let repository: FavoriteProductsRepositoryProtocol
    
    init(repository: FavoriteProductsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with id: Int) {
        repository.deleteProductFromFavorites(with: id)
        print("Product deleted from favorites")
    }
}


protocol DeleteProductFromFavoritesUseCaseProtocol {
    func execute(with id: Int)
}
