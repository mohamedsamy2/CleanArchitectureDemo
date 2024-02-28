//
//  Router.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 13/02/2024.
//

import UIKit

class Router: RouterProtocol {

    private let diContainer: DIContainerProtocol = DIContainer.shared
    
    func setupInitialViewController() -> UIViewController? {
        let initialViewController = ProductsListViewController()
        guard let presenter = diContainer.resolve(type: ProductsPresenterProtocol.self) else {
            return nil
        }
        presenter.view = initialViewController
        initialViewController.presenter = presenter
        return initialViewController
    }
    
    func navigateToProductDetails(product: ProductUIModel) {
        let productDetailsViewController = ProductDetailsViewController()
        var presenter = diContainer.resolve(type: ProductDetailsPresenterProtocol.self)
        presenter?.product = product
        productDetailsViewController.presenter = presenter
            if let navigationController = UIApplication.shared.currentUIWindow()?.rootViewController as? UINavigationController {
                navigationController.pushViewController(productDetailsViewController, animated: true)
            }
    }
}


protocol RouterProtocol {
    func setupInitialViewController() -> UIViewController?
    func navigateToProductDetails(product: ProductUIModel)
}
