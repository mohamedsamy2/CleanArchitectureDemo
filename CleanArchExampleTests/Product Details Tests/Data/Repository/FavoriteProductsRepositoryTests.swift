//
//  FavoriteProductsRepositoryTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

@testable import CleanArchExample
import XCTest

class FavoriteProductsRepositoryTests: XCTestCase {
    
    var repository: FavoriteProductsRepository!
    var mockLocalDataSource: MockFavoriteProductsLocalDataSource!
    
    override func setUp() {
        super.setUp()
        mockLocalDataSource = MockFavoriteProductsLocalDataSource()
        repository = FavoriteProductsRepository(localDataSource: mockLocalDataSource)
    }
    
    override func tearDown() {
        mockLocalDataSource = nil
        repository = nil
        super.tearDown()
    }
    
    func testAddProductToFavorites() {
        // Given
        let productID = 123
        
        // When
        repository.addProductToFavorites(with: productID)
        
        // Then
        XCTAssertTrue(mockLocalDataSource.favoriteProductIDs.contains(productID), "Product ID should be added to favorites")
    }
    
    func testDeleteProductFromFavorites() {
        // Given
        let productID = 456
        mockLocalDataSource.favoriteProductIDs = [productID, 789]
        
        // When
        repository.deleteProductFromFavorites(with: productID)
        
        // Then
        XCTAssertFalse(mockLocalDataSource.favoriteProductIDs.contains(productID), "Product ID should be deleted from favorites")
    }
    
    func testFetchFavoriteProductIDs() {
        // Given
        let favoriteProductIDs = [123, 456, 789]
        mockLocalDataSource.favoriteProductIDs = favoriteProductIDs
        
        // When
        let fetchedProductIDs = repository.fetchFavoriteProductIDs()
        
        // Then
        XCTAssertEqual(fetchedProductIDs, favoriteProductIDs, "Returned favorite product IDs should match the ones provided by the local data source")
    }
}
