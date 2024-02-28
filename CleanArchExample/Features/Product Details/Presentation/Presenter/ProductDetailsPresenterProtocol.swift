//
//  ProductDetailsPresenterProtocol.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 12/02/2024.
//

import Foundation

protocol ProductDetailsPresenterProtocol {
    var view: ProductDetailsViewControllerProtocol? { get set }
    var product: ProductUIModel? { get set }
    var btnTitle: String { get }
    func isProductFavorite() -> Bool
    func favoriteButtonPressed()
}
