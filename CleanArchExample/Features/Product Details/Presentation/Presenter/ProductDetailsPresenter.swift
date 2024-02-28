//
//  ProductDetailsPresenter.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 12/02/2024.
//

import Foundation

class ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    
    private let addProductToFavoritesUseCase: AddProductToFavoritesUseCaseProtocol
    private let deleteProductFromFavoritesUseCase: DeleteProductFromFavoritesUseCaseProtocol
    private let fetchFavoriteProductsUseCase: FetchFavoriteProductsUseCaseProtocol
    weak var view: ProductDetailsViewControllerProtocol?
    var product: ProductUIModel?
    var btnTitle: String {
        self.isProductFavorite() ? "Remove from favorites" : "Add to favorites"
    }
    
    
    init(addProductToFavoritesUseCase: AddProductToFavoritesUseCaseProtocol, deleteProductFromFavoritesUseCase: DeleteProductFromFavoritesUseCaseProtocol, fetchFavoriteProductsUseCase: FetchFavoriteProductsUseCaseProtocol) {
        self.addProductToFavoritesUseCase = addProductToFavoritesUseCase
        self.deleteProductFromFavoritesUseCase = deleteProductFromFavoritesUseCase
        self.fetchFavoriteProductsUseCase = fetchFavoriteProductsUseCase
    }
    
    func isProductFavorite() -> Bool {
        guard let id = product?.id else { return false }
        return fetchFavoriteProductsUseCase.execute().contains(id)
    }
    
    func favoriteButtonPressed() {
        isProductFavorite() ? deleteProductFromFavorites() : addProductToFavorites()
        view?.setupView()
    }
    
    private func addProductToFavorites() {
        guard let id = product?.id else { return }
        addProductToFavoritesUseCase.execute(with: id)
    }
    
    private func deleteProductFromFavorites() {
        guard let id = product?.id else { return }
        deleteProductFromFavoritesUseCase.execute(with: id)
    }
}
