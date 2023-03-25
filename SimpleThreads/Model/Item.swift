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

enum Price: String {
    case shirts = "$15.00"
    case hoodies = "$35.00"
    case sweatShirts = "$25.00"
    case toteBags = "$12.00"
    case socks = "$8.00"
}

struct Item {
    var name: String
    var price: Price
    var color: String
    var size: Size
    var inStock: Bool = true
    var description: String?
    var image: UIImage
    
    static let sampleData = [Item(name: "Shirt", price: .shirts, color: "Gray", size: .small, image: UIImage(named: "lightGrayShirt")!)]
}



