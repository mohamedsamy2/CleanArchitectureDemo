//
//  ProductRepositoryProtocol.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation

protocol ProductsRepositoryProtocol {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}
