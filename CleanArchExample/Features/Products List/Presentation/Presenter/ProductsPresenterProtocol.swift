//
//  ProductsPresenterProtocol.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation
protocol ProductsPresenterProtocol: AnyObject {
    func loadProducts()
    func presentProducts()
    func didSelectCell(at row: Int)
    var products: [ProductUIModel] { get }
    var view: ProductsListViewProtocol? { get set }
}
