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

enum Description: String {
    case shirts
    case hoodies
    case sweatShirts
    case toteBags
    case socks
    
    func getDescription() -> String {
        switch self {
        case .shirts:
            return "This t-shirt is a versatile and comfortable addition to any wardrobe. Made from high-quality cotton material, it features a classic crew neckline and short sleeves, providing a timeless and casual look. The shirt is available in a range of sizes and colors, making it easy to find the perfect fit and style for any individual."
        case .hoodies:
            return "This hoodie is a must-have for any casual wardrobe. Made from a soft and cozy blend of cotton and polyester, it features a comfortable, relaxed fit with ribbed cuffs and a hemline to keep the cold out."
        case .sweatShirts:
            return "This sweatshirt is the perfect blend of comfort and style. Made from a soft and cozy blend of cotton and polyester, it features a relaxed fit with ribbed cuffs and a hemline for a snug and secure fit. The sweatshirt also features a classic crew neckline and long sleeves, making it a great option for cooler weather."
        case .toteBags:
            return "This tote bag is a stylish and practical accessory for everyday use. Made from high-quality canvas or durable synthetic materials, it features sturdy handles for comfortable carrying and a spacious interior for all your essentials."
        case .socks:
            return "These socks are the perfect combination of style and comfort. Made from a high-quality blend of materials, such as cotton, they are soft, breathable, and gentle on the skin. The socks come in a range of sizes and styles, from no-show to knee-high, and feature various designs, patterns, and colors, making it easy to find the perfect fit and style for any individual. "
        }
    }
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
    
    init(name: String, price: Price, color: UIColor?, size: Size? = nil, image: String, category: Category?, description: String? = nil) {
        self.name = name
        self.price = price
        self.color = color
        self.size = size
        self.image = image
        self.category = category
        self.description = Description(rawValue: String(describing: price))?.getDescription()
    }
    
}

