//
//  MockProductsRemoteDataSource.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 13/02/2024.
//

@testable import CleanArchExample
import Foundation

// Mock class for testing
class MockProductsRemoteDataSource: ProductsRemoteDataSourceProtocol {
    
    var shouldFail: Bool = false
    
    func getProducts(completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
    
        if shouldFail {
            let error = NSError(domain: "Domain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty data"])
            completion(.failure(error))
            return
        }
        
        let product1 = Product(id: 1, price: 20.0, oldPrice: 30.0, discount: 10, image: "image_url_1", name: "Product 1", description: "Description 1", images: ["image_url_1_1", "image_url_1_2"], inFavorites: false, inCart: true)

        let product2 = Product(id: 2, price: 25.0, oldPrice: 35.0, discount: 10, image: "image_url_2", name: "Product 2", description: "Description 2", images: ["image_url_2_1", "image_url_2_2"], inFavorites: true, inCart: false)

        let product3 = Product(id: 3, price: 30.0, oldPrice: 40.0, discount: 10, image: "image_url_3", name: "Product 3", description: "Description 3", images: ["image_url_3_1", "image_url_3_2"], inFavorites: false, inCart: false)

        // Create data class
        let productData = ProductDataClass(currentPage: 1, data: [product1, product2, product3], firstPageURL: "first_page_url", from: 1, lastPage: 1, lastPageURL: "last_page_url", nextPageURL: nil, path: "path", perPage: 10, prevPageURL: nil, to: 3, total: 3)

        // Create product response
        let productResponse = ProductsResponse(status: true, message: nil, data: productData)
        completion(.success(productResponse))
        
    }
}
