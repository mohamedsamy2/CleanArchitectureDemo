//
//  ProductsListViewControllerProtocol.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 12/02/2024.
//

import Foundation

protocol ProductsListViewProtocol: AnyObject {
    func reloadTableview()
    func navigateToProductDetails(with product: ProductUIModel)
}
