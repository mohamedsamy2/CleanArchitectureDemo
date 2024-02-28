//
//  ProductDetailsPresenterTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

import XCTest
@testable import CleanArchExample

class ProductDetailsPresenterTests: XCTestCase {
    
    var presenter: ProductDetailsPresenter!
    var mockAddProductToFavoritesUseCase: MockAddProductToFavoritesUseCase!
    var mockDeleteProductFromFavoritesUseCase: MockDeleteProductFromFavoritesUseCase!
    var mockFetchFavoriteProductsUseCase: MockFetchFavoriteProductsUseCase!
    
    override func setUp() {
        super.setUp()
        mockAddProductToFavoritesUseCase = MockAddProductToFavoritesUseCase()
        mockDeleteProductFromFavoritesUseCase = MockDeleteProductFromFavoritesUseCase()
        mockFetchFavoriteProductsUseCase = MockFetchFavoriteProductsUseCase()
        presenter = ProductDetailsPresenter(addProductToFavoritesUseCase: mockAddProductToFavoritesUseCase,
                                             deleteProductFromFavoritesUseCase: mockDeleteProductFromFavoritesUseCase,
                                             fetchFavoriteProductsUseCase: mockFetchFavoriteProductsUseCase)
    }
    
    override func tearDown() {
        mockAddProductToFavoritesUseCase = nil
        mockDeleteProductFromFavoritesUseCase = nil
        mockFetchFavoriteProductsUseCase = nil
        presenter = nil
        super.tearDown()
    }
    
    func testIsProductFavorite_True() {
        // Given
        let productID = 123
        mockFetchFavoriteProductsUseCase.favoriteProductIDs = [productID]
        let product = ProductUIModel(id: productID, name: "Test Product", priceBeforeDiscount: "10", priceAfterDiscount: "8", image: "testImage")
        presenter.product = product
        
        // When
        let isFavorite = presenter.isProductFavorite()
        
        // Then
        XCTAssertTrue(isFavorite, "Product should be favorite")
    }
    
    func testIsProductFavorite_False() {
        // Given
        let productID = 456
        mockFetchFavoriteProductsUseCase.favoriteProductIDs = [123, 789] // Other product IDs
        let product = ProductUIModel(id: productID, name: "Test Product", priceBeforeDiscount: "10", priceAfterDiscount: "8", image: "testImage")
        presenter.product = product
        
        // When
        let isFavorite = presenter.isProductFavorite()
        
        // Then
        XCTAssertFalse(isFavorite, "Product should not be favorite")
    }
    
    func testFavoriteButtonPressed_AddToFavorites() {
        // Given
        let product = ProductUIModel(id: 123, name: "Test Product", priceBeforeDiscount: "10", priceAfterDiscount: "8", image: "testImage")
        presenter.product = product
        
        // When
        presenter.favoriteButtonPressed()
        
        // Then
        XCTAssertEqual(mockAddProductToFavoritesUseCase.addedProductID, product.id, "Product should be added to favorites")
    }
    
    func testFavoriteButtonPressed_RemoveFromFavorites() {
        // Given
        let product = ProductUIModel(id: 456, name: "Test Product", priceBeforeDiscount: "10", priceAfterDiscount: "8", image: "testImage")
        presenter.product = product
        mockFetchFavoriteProductsUseCase.favoriteProductIDs = [456] // Product is already in favorites
        
        // When
        presenter.favoriteButtonPressed()
        
        // Then
        XCTAssertEqual(mockDeleteProductFromFavoritesUseCase.deletedProductID, product.id, "Product should be removed from favorites")
    }
}

