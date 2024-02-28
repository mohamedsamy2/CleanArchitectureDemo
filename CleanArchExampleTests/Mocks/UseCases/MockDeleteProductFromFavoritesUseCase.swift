//
//  DeleteProductFromFavoritesUseCaseTests.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 21/02/2024.
//

import Foundation
@testable import CleanArchExample

class MockDeleteProductFromFavoritesUseCase: DeleteProductFromFavoritesUseCaseProtocol {
    var deletedProductID: Int?
    
    func execute(with id: Int) {
        deletedProductID = id
    }
}
