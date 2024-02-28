//
//  ProductsPresenterTests.swift
//  ProductsPresenterTests
//
//  Created by Mohamed Samy on 31/01/2024.


import XCTest
@testable import CleanArchExample

class ProductsPresenterTests: XCTestCase {
    
    var presenter: ProductsPresenter!
    var useCase: MockLoadProductsUseCase!

    override func setUp() {
        super.setUp()
        useCase = MockLoadProductsUseCase()
        presenter = ProductsPresenter(loadProductUseCase: useCase)
    }

    override func tearDown() {
        presenter = nil
        useCase = nil
        super.tearDown()
    }

    func testLoadProductSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Load products")

        // When
        presenter.loadProducts()

        // Then
        XCTAssertEqual(self.presenter.products.count, 3)
        expectation.fulfill()

        wait(for: [expectation], timeout: 5.0)
    }

}
