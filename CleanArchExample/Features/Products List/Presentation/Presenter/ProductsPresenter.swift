//
//  ProductsPresenter.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation

final class ProductsPresenter: ProductsPresenterProtocol {
    private let loadProductUseCase: LoadProductsUseCaseProtocol
    weak var view: ProductsListViewProtocol?
    var products: [ProductUIModel] = []
    
    init(loadProductUseCase: LoadProductsUseCaseProtocol) {
        self.loadProductUseCase = loadProductUseCase
    }
    
    func loadProducts() {
        LoadingView.show()
        loadProductUseCase.execute { [weak self] result in
            if case .success(let products) = result {
                LoadingView.hide()
                self?.mapProductsToUIModel(products: products)
                self?.presentProducts()
            }
        }
    }
    
    private func mapProductsToUIModel(products: [Product]) {
        self.products = products.map { product in
            return ProductUIModel(
                id: product.id, 
                name: product.name,
                priceBeforeDiscount: ("\(product.oldPrice) EGP"),
                priceAfterDiscount: ("\(product.price) EGP"),
                image: product.image
            )
        }
    }
    
    func presentProducts() {
        view?.reloadTableview()
    }
    
    func didSelectCell(at row: Int) {
        let selectedProduct = products[row]
        view?.navigateToProductDetails(with: selectedProduct)
    }
}
