//
//  ProductLocalDataSource.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 05/02/2024.
//

import Foundation

class ProductsLocalDataSource: ProductsLocalDataSourceProtocol {
    func getProducts() -> [Product]? {
              if let data = UserDefaults.standard.data(forKey: Constants.UserDefaultsKeys.productsData) {
                  let decoder = JSONDecoder()
                  do {
                      return try decoder.decode([Product].self, from: data)
                  } catch {
                      // Handle decoding error, return nil, or perform appropriate error handling
                      return nil
                  }
              }
              return nil
          }
    
    func saveProducts(_ products: [Product]) {
           let encoder = JSONEncoder()
           if let encodedData = try? encoder.encode(products) {
               UserDefaults.standard.set(encodedData, forKey: Constants.UserDefaultsKeys.productsData)
           }
       }
    
    func getCachedTimestamp() -> Date? {
        return UserDefaults.standard.value(forKey: Constants.UserDefaultsKeys.productsDataTimestamp) as? Date
    }

    func saveCachedTimestamp(_ timestamp: Date) {
        UserDefaults.standard.set(timestamp, forKey: Constants.UserDefaultsKeys.productsDataTimestamp)
    }
}



protocol ProductsLocalDataSourceProtocol {
    func getProducts() -> [Product]?
    func saveProducts(_ products: [Product])
    func getCachedTimestamp() -> Date?
    func saveCachedTimestamp(_ timestamp: Date)
}
