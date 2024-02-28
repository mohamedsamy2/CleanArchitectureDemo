//
//  FetchFavoriteProductsUseCase.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 13/02/2024.
//

import Foundation

class FetchFavoriteProductsUseCase: FetchFavoriteProductsUseCaseProtocol {
    private let repository: FavoriteProductsRepositoryProtocol
    
    init(repository: FavoriteProductsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> [Int] {
        repository.fetchFavoriteProductIDs()
    }
}


protocol FetchFavoriteProductsUseCaseProtocol {
    func execute() -> [Int]
}
