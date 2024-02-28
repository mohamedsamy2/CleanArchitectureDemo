//
//  FetchFavoriteProductsUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

@testable import CleanArchExample
import XCTest

class FetchFavoriteProductsUseCaseTests: XCTestCase {
    
    var useCase: FetchFavoriteProductsUseCase!
    var mockRepository: MockFavoriteProductsRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockFavoriteProductsRepository()
        useCase = FetchFavoriteProductsUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_ReturnsFavoriteProductIDs() {
        // Given
        let favoriteProductIDs = [123, 456, 789]
        mockRepository.favoriteProductIDs = favoriteProductIDs
        
        // When
        let fetchedProductIDs = useCase.execute()
        
        // Then
        XCTAssertEqual(fetchedProductIDs, favoriteProductIDs, "Returned favorite product IDs should match the ones provided by the repository")
    }
}
