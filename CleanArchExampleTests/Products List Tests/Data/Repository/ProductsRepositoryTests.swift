import XCTest
@testable import CleanArchExample

class ProductsRepositoryTests: XCTestCase {

    var repository: ProductsRepositoryProtocol!
    var mockRemoteDataSource: MockProductsRemoteDataSource!
    var mockLocalDataSource: MockProductsLocalDataSource!

    override func setUp() {
        super.setUp()
        mockRemoteDataSource = MockProductsRemoteDataSource()
        mockLocalDataSource = MockProductsLocalDataSource()
        repository = ProductsRepository(localDataSource: mockLocalDataSource, remoteDataSource: mockRemoteDataSource)
    }

    override func tearDown() {
        repository = nil
        mockRemoteDataSource = nil
        mockLocalDataSource = nil
        super.tearDown()
    }

    func testGetProductsWithCachedDataSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Load products")
        mockLocalDataSource.saveProducts([
            Product(id: 1, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: true, inCart: false),
            Product(id: 2, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: false, inCart: false),
            Product(id: 3, price: 20, oldPrice: 30, discount: 10, image: "", name: "", description: "", images: [], inFavorites: false, inCart: false)
        ])
        mockLocalDataSource.saveCachedTimestamp(Date())
        
        // When
        repository.getProducts { result in
            // Then
            switch result {
            case .success(let product):
                XCTAssertEqual(product.count, 3)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Unexpected failure")
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetProductsWithNoCachedDataSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Load products")
  
        // When
        repository.getProducts { result in
            // Then
            switch result {
            case .success(let product):
                XCTAssertEqual(product.count, 3)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Unexpected failure")
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testGetProductsFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Load products")
        mockRemoteDataSource.shouldFail = true
        
        // When
        repository.getProducts { result in
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
