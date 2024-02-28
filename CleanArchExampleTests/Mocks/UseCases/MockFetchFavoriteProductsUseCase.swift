//
//  FetchFavoriteProductsUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

import Foundation
@testable import CleanArchExample

class MockFetchFavoriteProductsUseCase: FetchFavoriteProductsUseCaseProtocol {
    var favoriteProductIDs: [Int] = []
    
    func execute() -> [Int] {
        return favoriteProductIDs
    }
}
