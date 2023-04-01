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
    var size: Size?
    var inStock: Bool = true
    var description: String?
    var image: UIImage
    
    static let sampleData = [
        Item(name: "White Women's T-Shirt", price: .shirts, color: "White", size: .small, image: UIImage(named: "WhiteWomens")!),
        Item(name: "Olive Green Women's T-Shirt", price: .shirts, color: "Olive Green", size: .small, image: UIImage(named: "OliveGreenWomens")!),
        Item(name: "Light Pink Women's T-Shirt", price: .shirts, color: "Light Pink", size: .small, image: UIImage(named: "LightPinkWomens")!),
        Item(name: "Light Grey Women's T-Shirt", price: .shirts, color: "Light Grey", size: .small, image: UIImage(named: "LightGreyWomens")!),
        Item(name: "Dark Grey Women's T-Shirt", price: .shirts, color: "Dark Grey", size: .small, image: UIImage(named: "DarkGreyWomens")!),
        Item(name: "Charcoal Women's T-Shirt", price: .shirts, color: "Charcoal", size: .small, image: UIImage(named: "CharcoalWomens")!),
        
        Item(name: "Olive Green Unisex T-Shirt", price: .shirts, color: "Olive Green", size: .small, image: UIImage(named: "OliveGreenUnisex")!),
        Item(name: "Ocean Blue Unisex T-Shirt", price: .shirts, color: "Ocean Blue", size: .small, image: UIImage(named: "OceanBlueUnisex")!),
        Item(name: "Mint Green Unisex T-Shirt", price: .shirts, color: "Mint Green", size: .small, image: UIImage(named: "MintGreenUnisex")!),
        Item(name: "Light Grey Unisex T-Shirt", price: .shirts, color: "Light Grey", size: .small, image: UIImage(named: "LightGreyUnisex")!),
        Item(name: "Light Blue Unisex T-Shirt", price: .shirts, color: "Light Blue", size: .small, image: UIImage(named: "LightBlueUnisex")!),
        Item(name: "Indigo Unisex T-Shirt", price: .shirts, color: "Indigo", size: .small, image: UIImage(named: "IndigoUnisex")!),
        Item(name: "Coral Unisex T-Shirt", price: .shirts, color: "Coral", size: .small, image: UIImage(named: "CoralUnisex")!),
        Item(name: "Charcoal Unisex T-Shirt", price: .shirts, color: "Charcoal", size: .small, image: UIImage(named: "CharcoalUnisex")!),
        Item(name: "Burnt Red Unisex T-Shirt", price: .shirts, color: "Burnt Red", size: .small, image: UIImage(named: "BurntRedUnisex")!),
        Item(name: "Burnt Orange Unisex T-Shirt", price: .shirts, color: "Burnt Organge", size: .small, image: UIImage(named: "BurntOrangeUnisex")!),
        
        Item(name: "Berry Mens T-Shirt", price: .shirts, color: "Berry", size: .small, image: UIImage(named: "BerryMens")!),
        Item(name: "Black Mens T-Shirt", price: .shirts, color: "Black", size: .small, image: UIImage(named: "BlackMens")!),
        Item(name: "Coral Mens T-Shirt", price: .shirts, color: "Coral", size: .small, image: UIImage(named: "CoralMens")!),
        Item(name: "Forest Green Mens T-Shirt", price: .shirts, color: "Forest Green", size: .small, image: UIImage(named: "ForestGreenMens")!),
        Item(name: "Gold Mens T-Shirt", price: .shirts, color: "Gold", size: .small, image: UIImage(named: "GoldMens")!),
        Item(name: "Navy Blue Mens T-Shirt", price: .shirts, color: "Navy Blue", size: .small, image: UIImage(named: "NavyBlueMens")!),
        Item(name: "Royal Blue Mens T-Shirt", price: .shirts, color: "Royal Blue", size: .small, image: UIImage(named: "RoyalBlueMens")!),
        
        Item(name: "Black Unisex Hoodie", price: .hoodies, color: "Black", size: .small, image: UIImage(named: "BlackHoodie")!),
        Item(name: "Dark Grey Unisex Hoodie", price: .hoodies, color: "Dark Grey", size: .small, image: UIImage(named: "DarkGreyHoodie")!),
        Item(name: "Green Unisex Hoodie", price: .hoodies, color: "Green", size: .small, image: UIImage(named: "GreenHoodie")!),
        Item(name: "Light Grey Unisex Hoodie", price: .hoodies, color: "Light Grey", size: .small, image: UIImage(named: "LightGreyHoodie")!),
        Item(name: "Magenta Unisex Hoodie", price: .hoodies, color: "Magenta", size: .small, image: UIImage(named: "MagentaHoodie")!),
        Item(name: "Navy Blue Unisex Hoodie", price: .hoodies, color: "Navy Blue", size: .small, image: UIImage(named: "NavyBlueHoodie")!),
        Item(name: "Pink Unisex Hoodie", price: .hoodies, color: "Pink", size: .small, image: UIImage(named: "PinkHoodie")!),
        Item(name: "Plum Unisex Hoodie", price: .hoodies, color: "Plum", size: .small, image: UIImage(named: "PlumHoodie")!),
        Item(name: "Royal Blue Unisex Hoodie", price: .hoodies, color: "Royal Blue", size: .small, image: UIImage(named: "Royal Blue Hoodie")!),
        Item(name: "Tan Unisex Hoodie", price: .hoodies, color: "Tan", size: .small, image: UIImage(named: "TanHoodie")!),
        
        Item(name: "Black Unisex Sweatshirt", price: .sweatShirts, color: "Black", size: .small, image: UIImage(named: "BlackSweatshirt")!),
        Item(name: "Cyan Unisex Sweatshirt", price: .sweatShirts, color: "Cyan", size: .small, image: UIImage(named: "CyanSweatshirt")!),
        Item(name: "Green Unisex Sweatshirt", price: .sweatShirts, color: "Green", size: .small, image: UIImage(named: "GreenSweatshirt")!),
        Item(name: "Navy Blue Unisex Sweatshirt", price: .sweatShirts, color: "Navy Blue", size: .small, image: UIImage(named: "NavyBlueSweatshirt")!),
        Item(name: "Pink Unisex Sweatshirt", price: .sweatShirts, color: "Pink", size: .small, image: UIImage(named: "PinkSweatshirt")!),
        Item(name: "Plum Unisex Sweatshirt", price: .sweatShirts, color: "Plum", size: .small, image: UIImage(named: "PlumSweatshirt")!),
        
        Item(name: "Black Ankle Socks", price: .socks, color: "Black", size: .small, image: UIImage(named: "BlackAnkleSocks")!),
        Item(name: "Light Grey Ankle Socks", price: .socks, color: "Light Grey", size: .small, image: UIImage(named: "LightGreyAnkleSocks")!),
        Item(name: "White Ankle Socks", price: .socks, color: "White", size: .small, image: UIImage(named: "WhiteAnkleSocks")!),
        Item(name: "Orange Long Socks", price: .socks, color: "Orange", size: .small, image: UIImage(named: "OrangeLongSocks")!),
        Item(name: "Pink Long Socks", price: .socks, color: "Pink", size: .small, image: UIImage(named: "PinkLongSocks")!),
        Item(name: "Yellow Long Socks", price: .socks, color: "Yellow", size: .small, image: UIImage(named: "YellowLongSocks")!),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: "Light Grey", size: .small, image: UIImage(named: "LightGreyNoShowSocks")!),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: "Light Grey", size: .small, image: UIImage(named: "LightGreyNoShowSocks")!),
        Item(name: "Navy Blue No-Show Socks", price: .socks, color: "Navy Blue", size: .small, image: UIImage(named: "NavyBlueNoShowSocks")!),
        Item(name: "Taupe No-Show Socks", price: .socks, color: "Taupe", size: .small, image: UIImage(named: "TaupeNoShowSocks")!),
        
        
        Item(name: "Black Tote Bag", price: .toteBags, color: "Black", image: UIImage(named: "BlackToteBag")!),
        Item(name: "Burnt Yellow Tote Bag", price: .toteBags, color: "Burnt Yellow", image: UIImage(named: "BurntYellowToteBag")!),
        Item(name: "Light Pink Tote Bag", price: .toteBags, color: "Light Pink", image: UIImage(named: "LightPinkToteBag")!),
        Item(name: "Tan Tote Bag", price: .toteBags, color: "Tan", image: UIImage(named: "TanToteBag")!),
        Item(name: "White Tote Bag", price: .toteBags, color: "White", image: UIImage(named: "WhiteToteBag")!),
        
        
    ]
    
}



