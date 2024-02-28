//
//  ProductRemoteDataSource.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 05/02/2024.
//

import Foundation

class ProductRemoteDataSource: ProductsRemoteDataSourceProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getProducts(completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        guard let url = URL(string: Endpoints.productsEndPoint.rawValue) else {
            return
        }
        networkManager.fetchData(url: url, completion: completion)
    }
}


protocol ProductsRemoteDataSourceProtocol {
    func getProducts(completion: @escaping (Result<ProductsResponse, Error>) -> Void)
}
