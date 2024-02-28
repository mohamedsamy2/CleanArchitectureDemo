//
//  LoadProductsUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 31/01/2024.
//

import XCTest
@testable import CleanArchExample

class LoadProductsUseCaseTests: XCTestCase {

    var loadProductsUseCase: LoadProductsUseCase!
    var mockRepository: MockProductsRepository!

    override func setUp() {
        mockRepository = MockProductsRepository()
        loadProductsUseCase = LoadProductsUseCase(productRepository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        loadProductsUseCase = nil
    }
    
    func testExecuteSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Load products")

        // When
        loadProductsUseCase.execute { result in
            // Then
            switch result {
            case .success(let products):
                XCTAssertEqual(products.count, 3)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Unexpected failure")
            }
        }

        wait(for: [expectation], timeout: 5.0) // Adjust the timeout based on your use case
    }

    func testExecuteFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Load products")

        // When
        mockRepository.shouldFail = true
        loadProductsUseCase.execute { result in
            // Then
            switch result {
            case .success(_):
                XCTFail("Unexpected success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
