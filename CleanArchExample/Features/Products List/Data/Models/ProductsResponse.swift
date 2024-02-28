//
//  Product.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Foundation

// MARK: - Product
struct ProductsResponse: Codable {
    let status: Bool
    let message: String?
    let data: ProductDataClass
}

// MARK: - DataClass
struct ProductDataClass: Codable {
    let currentPage: Int
    let data: [Product]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}
