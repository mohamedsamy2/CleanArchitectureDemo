//
//  AddProductToFavoritesUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

@testable import CleanArchExample
import XCTest

class AddProductToFavoritesUseCaseTests: XCTestCase {
    
    var useCase: AddProductToFavoritesUseCase!
    var mockRepository: MockFavoriteProductsRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockFavoriteProductsRepository()
        useCase = AddProductToFavoritesUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_AddToFavorites() {
        // Given
        let productID = 123
        
        // When
        useCase.execute(with: productID)
        
        // Then
        XCTAssertEqual(mockRepository.addedProductID, productID, "Wrong product ID added to favorites")
    }
}
