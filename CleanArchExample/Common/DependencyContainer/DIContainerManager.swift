//
//  DIContainerManager.swift
//  TestCleanArchitecture
//
//  Created by Mohamed Aboushady on 06/02/2024.
//

import Foundation
import UIKit

enum AppEnvironemt {
    case staging
    case mocking
}

final class DIManager{
    static let shared = DIManager()
    private init(){}
    
    
    func registerDependencies()  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access AppDelegate")
        }
        switch appDelegate.appEnvironment {
        case .mocking:
            registerMockDependencies()
        case .staging:
            registerStagingDependencies()
        }
    }
    
    private func registerStagingDependencies(){
        
        DIContainer.shared.register(type: NetworkManagerProtocol.self, component: URLSessionNetworkManager.shared)
        
        DIContainer.shared.register(type: ProductsRemoteDataSourceProtocol.self, component: ProductRemoteDataSource(networkManager: DIContainer.shared.resolve(type: NetworkManagerProtocol.self)!))
        
        DIContainer.shared.register(type: ProductsLocalDataSourceProtocol.self, component: ProductsLocalDataSource())
        
        DIContainer.shared.register(type: ProductsRepositoryProtocol.self, component: ProductsRepository(localDataSource: DIContainer.shared.resolve(type: ProductsLocalDataSourceProtocol.self)!, remoteDataSource: DIContainer.shared.resolve(type: ProductsRemoteDataSourceProtocol.self)!))
        
        DIContainer.shared.register(type: LoadProductsUseCaseProtocol.self, component: LoadProductsUseCase(productRepository: DIContainer.shared.resolve(type: ProductsRepositoryProtocol.self)!))
        
        DIContainer.shared.register(type: ProductsPresenterProtocol.self, component: ProductsPresenter(loadProductUseCase: DIContainer.shared.resolve(type: LoadProductsUseCaseProtocol.self)!))
        
        DIContainer.shared.register(type: FavoriteProductsLocalDataSourceProtocol.self, component: FavoriteProductsLocalDataSource())
        
        DIContainer.shared.register(type: FavoriteProductsRepositoryProtocol.self, component: FavoriteProductsRepository(localDataSource: DIContainer.shared.resolve(type: FavoriteProductsLocalDataSourceProtocol.self)!))
        
        let favProductRepository = DIContainer.shared.resolve(type: FavoriteProductsRepositoryProtocol.self)!
        
        DIContainer.shared.register(type: AddProductToFavoritesUseCaseProtocol.self, component: AddProductToFavoritesUseCase(repository: favProductRepository))
        
        DIContainer.shared.register(type: DeleteProductFromFavoritesUseCaseProtocol.self, component: DeleteProductFromFavoritesUseCase(repository: favProductRepository))

        DIContainer.shared.register(type: FetchFavoriteProductsUseCaseProtocol.self, component: FetchFavoriteProductsUseCase(repository: favProductRepository))

        let addFavoriteUseCase = DIContainer.shared.resolve(type: AddProductToFavoritesUseCaseProtocol.self)!
        
        let deleteFavoriteUseCase = DIContainer.shared.resolve(type: DeleteProductFromFavoritesUseCaseProtocol.self)
        
        let fetchFavoriteUseCase = DIContainer.shared.resolve(type: FetchFavoriteProductsUseCaseProtocol.self)
        
        DIContainer.shared.register(type: ProductDetailsPresenterProtocol.self, component: ProductDetailsPresenter(addProductToFavoritesUseCase: addFavoriteUseCase, deleteProductFromFavoritesUseCase: deleteFavoriteUseCase!, fetchFavoriteProductsUseCase: fetchFavoriteUseCase!))
        
    }
    
    
    private func registerMockDependencies(){
        
        DIContainer.shared.register(type: NetworkManagerProtocol.self, component: AlamofireNetworkManager.shared)
        
        DIContainer.shared.register(type: ProductsRemoteDataSourceProtocol.self, component: MockProductsRemoteDataSource())
        
        DIContainer.shared.register(type: ProductsLocalDataSourceProtocol.self, component: MockProductsLocalDataSource())
        
        DIContainer.shared.register(type: ProductsRepositoryProtocol.self, component: ProductsRepository(localDataSource: DIContainer.shared.resolve(type: ProductsLocalDataSourceProtocol.self)!, remoteDataSource: DIContainer.shared.resolve(type: ProductsRemoteDataSourceProtocol.self)!))
        
        DIContainer.shared.register(type: LoadProductsUseCaseProtocol.self, component: LoadProductsUseCase(productRepository: DIContainer.shared.resolve(type: ProductsRepositoryProtocol.self)!))
        
        DIContainer.shared.register(type: ProductsPresenterProtocol.self, component: ProductsPresenter(loadProductUseCase: DIContainer.shared.resolve(type: LoadProductsUseCaseProtocol.self)!))
        
        DIContainer.shared.register(type: FavoriteProductsLocalDataSourceProtocol.self, component: FavoriteProductsLocalDataSource())
        
        DIContainer.shared.register(type: FavoriteProductsRepositoryProtocol.self, component: FavoriteProductsRepository(localDataSource: DIContainer.shared.resolve(type: FavoriteProductsLocalDataSourceProtocol.self)!))
        
        let favProductRepository = DIContainer.shared.resolve(type: FavoriteProductsRepositoryProtocol.self)!
        
        DIContainer.shared.register(type: AddProductToFavoritesUseCaseProtocol.self, component: AddProductToFavoritesUseCase(repository: favProductRepository))
        
        DIContainer.shared.register(type: DeleteProductFromFavoritesUseCaseProtocol.self, component: DeleteProductFromFavoritesUseCase(repository: favProductRepository))

        DIContainer.shared.register(type: FetchFavoriteProductsUseCaseProtocol.self, component: FetchFavoriteProductsUseCase(repository: favProductRepository))

        let addFavoriteUseCase = DIContainer.shared.resolve(type: AddProductToFavoritesUseCaseProtocol.self)!
        
        let deleteFavoriteUseCase = DIContainer.shared.resolve(type: DeleteProductFromFavoritesUseCaseProtocol.self)
        
        let fetchFavoriteUseCase = DIContainer.shared.resolve(type: FetchFavoriteProductsUseCaseProtocol.self)
        
        DIContainer.shared.register(type: ProductDetailsPresenterProtocol.self, component: ProductDetailsPresenter(addProductToFavoritesUseCase: addFavoriteUseCase, deleteProductFromFavoritesUseCase: deleteFavoriteUseCase!, fetchFavoriteProductsUseCase: fetchFavoriteUseCase!))
        
    }
    
}

