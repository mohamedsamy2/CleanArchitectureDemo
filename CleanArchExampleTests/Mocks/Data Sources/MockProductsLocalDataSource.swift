//
//  ProductsLocalDataSource.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 13/02/2024.
//

@testable import CleanArchExample
import Foundation

// Mock class for testing
class MockProductsLocalDataSource: ProductsLocalDataSourceProtocol {
    var products: [Product] = []
    var cachedTimestamp: Date?

    func getProducts() -> [Product]? {
        return products
    }
    
    func saveProducts(_ products: [Product]) {
        self.products = products
    }
    
    func getCachedTimestamp() -> Date? {
        return cachedTimestamp
    }
    
    func saveCachedTimestamp(_ timestamp: Date) {
        cachedTimestamp = timestamp
    }
}


