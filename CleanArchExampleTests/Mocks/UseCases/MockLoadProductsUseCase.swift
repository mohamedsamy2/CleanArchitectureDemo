//
//  MockLoadProductUseCase.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 31/01/2024.
//
@testable import CleanArchExample
import Foundation

// Mock class for testing
class MockLoadProductsUseCase: LoadProductsUseCaseProtocol {

    var shouldFail: Bool = false
    
    func execute(completion: @escaping (Result<[Product], Error>) -> Void) {
            if shouldFail {
                completion(.failure(NSError(domain: "MockErrorDomain", code: 123, userInfo: nil)))
            } else {
                let mockProducts = [
                    Product(id: 1, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: true, inCart: false),
                    Product(id: 2, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: false, inCart: false),
                    Product(id: 3, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: false, inCart: false)
                ]
                completion(.success(mockProducts))
            }
    }
}
