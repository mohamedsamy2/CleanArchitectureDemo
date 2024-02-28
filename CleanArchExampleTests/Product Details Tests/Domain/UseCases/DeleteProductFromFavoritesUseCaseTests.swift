//
//  DeleteProductFromFavoritesUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

@testable import CleanArchExample
import XCTest

class DeleteProductFromFavoritesUseCaseTests: XCTestCase {
    
    var useCase: DeleteProductFromFavoritesUseCase!
    var mockRepository: MockFavoriteProductsRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockFavoriteProductsRepository()
        useCase = DeleteProductFromFavoritesUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_RemoveFromFavorites() {
        // Given
        let productID = 123
        
        // When
        useCase.execute(with: productID)
        
        // Then
        XCTAssertEqual(mockRepository.deletedProductID, productID, "Wrong product ID deleted from favorites")
    }
}
