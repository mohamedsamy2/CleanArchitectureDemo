//
//  LoadProductUseCase.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation

final class LoadProductsUseCase: LoadProductsUseCaseProtocol {

    private let productRepository: ProductsRepositoryProtocol

    init(productRepository: ProductsRepositoryProtocol) {
        self.productRepository = productRepository
    }

    func execute(completion: @escaping (Result<[Product], Error>) -> Void) {
        productRepository.getProducts(completion: completion)
    }
}
