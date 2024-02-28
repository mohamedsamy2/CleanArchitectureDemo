//
//  AddProductToFavoritesUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

import Foundation
@testable import CleanArchExample

class MockAddProductToFavoritesUseCase: AddProductToFavoritesUseCaseProtocol {
    var addedProductID: Int?
    
    func execute(with id: Int) {
        addedProductID = id
    }
}
