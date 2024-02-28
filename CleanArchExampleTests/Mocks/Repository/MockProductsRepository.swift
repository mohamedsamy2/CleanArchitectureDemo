//
//  MockProductsRepository.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 31/01/2024.
//

@testable import CleanArchExample
import Foundation

class MockProductsRepository: ProductsRepositoryProtocol {
    
    var shouldFail = false

    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        if shouldFail {
            completion(.failure(NSError(domain: "MockErrorDomain", code: 123, userInfo: nil)))
        } else {
            let mockCategories = [
                Product(id: 1, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: true, inCart: false),
                Product(id: 2, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: false, inCart: false),
                Product(id: 3, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: false, inCart: false)
            ]
            completion(.success(mockCategories))
        }
    }
}
