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

enum Category: String {
    case unisexShirt
    case womensShirt
    case mensShirt
    case sweatshirt
    case hoodie
    case totebag
    case socks
}

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var price: Price
    var color: UIColor?
    var size: Size?
    var inStock: Bool = true
    var description: String?
    var image: UIImage
    var category: Category?
    
    static let sampleData = [
        
        // Womens Shirts :
        Item(name: "White Women's T-Shirt", price: .shirts, color: .white, size: .small, image: UIImage(named: "WhiteWomens")!, category: .womensShirt),
        Item(name: "Olive Green Women's T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: UIImage(named: "OliveGreenWomens")!, category: .womensShirt),
        Item(name: "Light Pink Women's T-Shirt", price: .shirts, color: .lightPink, size: .small, image: UIImage(named: "LightPinkWomens")!, category: .womensShirt),
        Item(name: "Light Grey Women's T-Shirt", price: .shirts, color: .lightGray, size: .small, image: UIImage(named: "LightGreyWomens")!, category: .womensShirt),
        Item(name: "Dark Grey Women's T-Shirt", price: .shirts, color: .darkGray, size: .small, image: UIImage(named: "DarkGreyWomens")!, category: .womensShirt),
        Item(name: "Charcoal Women's T-Shirt", price: .shirts, color: .charcoal, size: .small, image: UIImage(named: "CharcoalWomens")!, category: .womensShirt),
        
        // Unisex Shirts :
        Item(name: "Olive Green Unisex T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: UIImage(named: "OliveGreenUnisex")!, category: .unisexShirt),
        Item(name: "Ocean Blue Unisex T-Shirt", price: .shirts, color: .oceanBlue, size: .small, image: UIImage(named: "OceanBlueUnisex")!, category: .unisexShirt),
        Item(name: "Mint Green Unisex T-Shirt", price: .shirts, color: .mintGreen, size: .small, image: UIImage(named: "MintGreenUnisex")!, category: .unisexShirt),
        Item(name: "Light Grey Unisex T-Shirt", price: .shirts, color: .lightGray, size: .small, image: UIImage(named: "LightGreyUnisex")!, category: .unisexShirt),
        Item(name: "Light Blue Unisex T-Shirt", price: .shirts, color: .lightBlue, size: .small, image: UIImage(named: "LightBlueUnisex")!, category: .unisexShirt),
        Item(name: "Indigo Unisex T-Shirt", price: .shirts, color: .indigoBlue, size: .small, image: UIImage(named: "IndigoUnisex")!, category: .unisexShirt),
        Item(name: "Coral Unisex T-Shirt", price: .shirts, color: .coral, size: .small, image: UIImage(named: "CoralUnisex")!, category: .unisexShirt),
        Item(name: "Charcoal Unisex T-Shirt", price: .shirts, color: .charcoal, size: .small, image: UIImage(named: "CharcoalUnisex")!, category: .unisexShirt),
        Item(name: "Burnt Red Unisex T-Shirt", price: .shirts, color: .burntRed, size: .small, image: UIImage(named: "BurntRedUnisex")!, category: .unisexShirt),
        Item(name: "Burnt Orange Unisex T-Shirt", price: .shirts, color: .burntOrange, size: .small, image: UIImage(named: "BurntOrangeUnisex")!, category: .unisexShirt),
        
        // Mens Shirt
        Item(name: "Berry Mens T-Shirt", price: .shirts, color: .berry, size: .small, image: UIImage(named: "BerryMens")!, category: .mensShirt),
        Item(name: "Black Mens T-Shirt", price: .shirts, color: .black, size: .small, image: UIImage(named: "BlackMens")!, category: .mensShirt),
        Item(name: "Coral Mens T-Shirt", price: .shirts, color: .coral, size: .small, image: UIImage(named: "CoralMens")!, category: .mensShirt),
        Item(name: "Forest Green Mens T-Shirt", price: .shirts, color: .forestGreen, size: .small, image: UIImage(named: "ForestGreenMens")!, category: .mensShirt),
        Item(name: "Gold Mens T-Shirt", price: .shirts, color: .gold, size: .small, image: UIImage(named: "GoldMens")!, category: .mensShirt),
        Item(name: "Navy Blue Mens T-Shirt", price: .shirts, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueMens")!, category: .mensShirt),
        Item(name: "Royal Blue Mens T-Shirt", price: .shirts, color: .blue, size: .small, image: UIImage(named: "RoyalBlueMens")!, category: .mensShirt),
        
        // Hoodies :
        Item(name: "Black Unisex Hoodie", price: .hoodies, color: .black, size: .small, image: UIImage(named: "BlackHoodie")!, category: .hoodie),
        Item(name: "Dark Grey Unisex Hoodie", price: .hoodies, color: .darkGray, size: .small, image: UIImage(named: "DarkGreyHoodie")!, category: .hoodie),
        Item(name: "Green Unisex Hoodie", price: .hoodies, color: .greenHoodie, size: .small, image: UIImage(named: "GreenHoodie")!, category: .hoodie),
        Item(name: "Light Grey Unisex Hoodie", price: .hoodies, color: .lightGray, size: .small, image: UIImage(named: "LightGreyHoodie")!, category: .hoodie),
        Item(name: "Magenta Unisex Hoodie", price: .hoodies, color: .mangentaPurple, size: .small, image: UIImage(named: "MagentaHoodie")!, category: .hoodie),
        Item(name: "Navy Blue Unisex Hoodie", price: .hoodies, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueHoodie")!, category: .hoodie),
        Item(name: "Pink Unisex Hoodie", price: .hoodies, color: .customPinkHoodie, size: .small, image: UIImage(named: "PinkHoodie")!, category: .hoodie),
        Item(name: "Plum Unisex Hoodie", price: .hoodies, color: .plum, size: .small, image: UIImage(named: "PlumHoodie")!, category: .hoodie),
        Item(name: "Royal Blue Unisex Hoodie", price: .hoodies, color: .blue, size: .small, image: UIImage(named: "RoyalBlueHoodie")!, category: .hoodie),
        Item(name: "Tan Unisex Hoodie", price: .hoodies, color: .tan, size: .small, image: UIImage(named: "TanHoodie")!, category: .hoodie),
        
        Item(name: "Black Unisex Sweatshirt", price: .sweatShirts, color: .black, size: .small, image: UIImage(named: "BlackSweatshirt")!, category: .sweatshirt),
        Item(name: "Cyan Unisex Sweatshirt", price: .sweatShirts, color: .cyanBlue, size: .small, image: UIImage(named: "CyanSweatshirt")!, category: .sweatshirt),
        Item(name: "Green Unisex Sweatshirt", price: .sweatShirts, color: .customGreenSweatshirt, size: .small, image: UIImage(named: "GreenSweatshirt")!, category: .sweatshirt),
        Item(name: "Navy Blue Unisex Sweatshirt", price: .sweatShirts, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueSweatshirt")!, category: .sweatshirt),
        Item(name: "Pink Unisex Sweatshirt", price: .sweatShirts, color: .customPinkSweatshirt, size: .small, image: UIImage(named: "PinkSweatshirt")!, category: .sweatshirt),
        Item(name: "Plum Unisex Sweatshirt", price: .sweatShirts, color: .plum, size: .small, image: UIImage(named: "PlumSweatshirt")!, category: .sweatshirt),
        
        Item(name: "Black Ankle Socks", price: .socks, color: .black, size: .small, image: UIImage(named: "BlackAnkleSocks")!, category: .socks),
        Item(name: "Light Grey Ankle Socks", price: .socks, color: .customLightGrey, size: .small, image: UIImage(named: "LightGreyAnkleSocks")!, category: .socks),
        Item(name: "White Ankle Socks", price: .socks, color: .white, size: .small, image: UIImage(named: "WhiteAnkleSocks")!, category: .socks),
        Item(name: "Orange Long Socks", price: .socks, color: .customOrange, size: .small, image: UIImage(named: "OrangeLongSocks")!, category: .socks),
        Item(name: "Pink Long Socks", price: .socks, color: .customNeonPink, size: .small, image: UIImage(named: "PinkLongSocks")!, category: .socks),
        Item(name: "Yellow Long Socks", price: .socks, color: .customYellow, size: .small, image: UIImage(named: "YellowLongSocks")!, category: .socks),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: .customLightGrey, size: .small, image: UIImage(named: "LightGreyNoShowSocks")!, category: .socks),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: .customLightGrey, size: .small, image: UIImage(named: "LightGreyNoShowSocks")!, category: .socks),
        Item(name: "Navy Blue No-Show Socks", price: .socks, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueNoShowSocks")!, category: .socks),
        Item(name: "Taupe No-Show Socks", price: .socks, color: .taupe, size: .small, image: UIImage(named: "TaupeNoShowSocks")!, category: .socks),
        
        
        Item(name: "Black Tote Bag", price: .toteBags, color: .black, image: UIImage(named: "BlackToteBag")!, category: .totebag),
        Item(name: "Burnt Yellow Tote Bag", price: .toteBags, color: .burntYellow, image: UIImage(named: "BurntYellowToteBag")!, category: .totebag),
        Item(name: "Light Pink Tote Bag", price: .toteBags, color: .lightPink, image: UIImage(named: "LightPinkToteBag")!, category: .totebag),
        Item(name: "Tan Tote Bag", price: .toteBags, color: .tan, image: UIImage(named: "TanToteBag")!, category: .totebag),
        Item(name: "White Tote Bag", price: .toteBags, color: .white, image: UIImage(named: "WhiteToteBag")!, category: .totebag),
    ]
}



