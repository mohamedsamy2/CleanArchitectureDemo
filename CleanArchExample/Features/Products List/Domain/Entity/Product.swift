//
//  Product.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 14/02/2024.
//

struct Product: Codable {
    let id: Int
    let price, oldPrice: Double
    let discount: Int
    let image: String
    let name, description: String
    let images: [String]
    let inFavorites, inCart: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name, description, images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}
