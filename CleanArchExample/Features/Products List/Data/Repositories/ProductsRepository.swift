//
//  Repository.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation

final class ProductsRepository: ProductsRepositoryProtocol {
    private let localDataSource: ProductsLocalDataSourceProtocol
    private let remoteDataSource: ProductsRemoteDataSourceProtocol
    
    init(localDataSource: ProductsLocalDataSourceProtocol,
         remoteDataSource: ProductsRemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
          // Attempt to fetch data from the local storage
          if let cachedData = localDataSource.getProducts(), let timestamp = localDataSource.getCachedTimestamp(), shouldUseCachedData(timestamp: timestamp) {
              // Use the cached data if it's fresh
              completion(.success(cachedData))
          } else {
              // Fetch data from the remote API
              remoteDataSource.getProducts { [weak self] result in
                  switch result {
                  case .success(let products):
                      // Save the fetched data and timestamp locally
                      self?.localDataSource.saveProducts(products.data.data)
                      self?.localDataSource.saveCachedTimestamp(Date())
                      completion(.success(products.data.data))

                  case .failure(let error):
                      completion(.failure(error))
                  }
              }
          }
      }

    
    private func shouldUseCachedData(timestamp: Date) -> Bool {
        let expirationInterval: TimeInterval = 60 // 60 seconds

        // Calculate the time interval between the current date and the cached timestamp
        let elapsedTime = Date().timeIntervalSince(timestamp)

        // Return true if the elapsed time is less than the expiration interval
        return elapsedTime < expirationInterval
    }

}



