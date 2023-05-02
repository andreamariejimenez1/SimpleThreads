//
//  Product.swift
//  SimpleThreads
//
//  Created by Ahmet Bilici on 10/15/22.
//
import UIKit

enum Size: String {
    case xSmall = "XS"
    case small = "S"
    case medium = "M"
    case large = "L"
    case xLarge = "XL"
    case xxLarge = "XXL"
}

enum Price: Double {
    case shirts = 15
    case hoodies = 35
    case sweatShirts = 25
    case toteBags = 12
    case socks = 8
}

enum Category: Int, CaseIterable {
    case all
    case unisexShirt
    case womensShirt
    case mensShirt
    case sweatShirt
    case hoodie
    case totebag
    case socks
    
    func getTitle() -> String {

        switch self {
        case .all:
            return "All"
        case .unisexShirt:
            return "Unisex Shirts"
        case .womensShirt:
            return "Womens Shirts"
        case .mensShirt:
            return "Mens Shirts"
        case .sweatShirt:
            return "Sweatshirts"
        case .hoodie:
            return "Hoodies"
        case .totebag:
            return "Tote Bags"
        case .socks:
            return "Socks"
        }
    }
}

struct Item: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var price: Price
    var color: UIColor?
    var size: Size?
    var inStock: Bool = true
    var description: String?
    var image: String
    var category: Category?
    
}



