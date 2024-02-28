//
//  LoadProductUseCaseProtocol.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation

protocol LoadProductsUseCaseProtocol {
    func execute(completion: @escaping (Result<[Product], Error>) -> Void)
}
