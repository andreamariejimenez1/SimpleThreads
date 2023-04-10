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

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var price: Price
    var color: UIColor?
    var size: Size?
    var inStock: Bool = true
    var description: String?
    var image: UIImage
    
    static let sampleData = [
        Item(name: "White Women's T-Shirt", price: .shirts, color: .white, size: .small, image: UIImage(named: "WhiteWomens")!),
        Item(name: "Olive Green Women's T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: UIImage(named: "OliveGreenWomens")!),
        Item(name: "Light Pink Women's T-Shirt", price: .shirts, color: .lightPink, size: .small, image: UIImage(named: "LightPinkWomens")!),
        Item(name: "Light Grey Women's T-Shirt", price: .shirts, color: .lightGray, size: .small, image: UIImage(named: "LightGreyWomens")!),
        Item(name: "Dark Grey Women's T-Shirt", price: .shirts, color: .darkGray, size: .small, image: UIImage(named: "DarkGreyWomens")!),
        Item(name: "Charcoal Women's T-Shirt", price: .shirts, color: .charcoal, size: .small, image: UIImage(named: "CharcoalWomens")!),
        
        Item(name: "Olive Green Unisex T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: UIImage(named: "OliveGreenUnisex")!),
        Item(name: "Ocean Blue Unisex T-Shirt", price: .shirts, color: .oceanBlue, size: .small, image: UIImage(named: "OceanBlueUnisex")!),
        Item(name: "Mint Green Unisex T-Shirt", price: .shirts, color: .mintGreen, size: .small, image: UIImage(named: "MintGreenUnisex")!),
        Item(name: "Light Grey Unisex T-Shirt", price: .shirts, color: .lightGray, size: .small, image: UIImage(named: "LightGreyUnisex")!),
        Item(name: "Light Blue Unisex T-Shirt", price: .shirts, color: .lightBlue, size: .small, image: UIImage(named: "LightBlueUnisex")!),
        Item(name: "Indigo Unisex T-Shirt", price: .shirts, color: .indigoBlue, size: .small, image: UIImage(named: "IndigoUnisex")!),
        Item(name: "Coral Unisex T-Shirt", price: .shirts, color: .coral, size: .small, image: UIImage(named: "CoralUnisex")!),
        Item(name: "Charcoal Unisex T-Shirt", price: .shirts, color: .charcoal, size: .small, image: UIImage(named: "CharcoalUnisex")!),
        Item(name: "Burnt Red Unisex T-Shirt", price: .shirts, color: .burntRed, size: .small, image: UIImage(named: "BurntRedUnisex")!),
        Item(name: "Burnt Orange Unisex T-Shirt", price: .shirts, color: .burntOrange, size: .small, image: UIImage(named: "BurntOrangeUnisex")!),
        
        Item(name: "Berry Mens T-Shirt", price: .shirts, color: .berry, size: .small, image: UIImage(named: "BerryMens")!),
        Item(name: "Black Mens T-Shirt", price: .shirts, color: .black, size: .small, image: UIImage(named: "BlackMens")!),
        Item(name: "Coral Mens T-Shirt", price: .shirts, color: .coral, size: .small, image: UIImage(named: "CoralMens")!),
        Item(name: "Forest Green Mens T-Shirt", price: .shirts, color: .forestGreen, size: .small, image: UIImage(named: "ForestGreenMens")!),
        Item(name: "Gold Mens T-Shirt", price: .shirts, color: .gold, size: .small, image: UIImage(named: "GoldMens")!),
        Item(name: "Navy Blue Mens T-Shirt", price: .shirts, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueMens")!),
        Item(name: "Royal Blue Mens T-Shirt", price: .shirts, color: .blue, size: .small, image: UIImage(named: "RoyalBlueMens")!),
        
        Item(name: "Black Unisex Hoodie", price: .hoodies, color: .black, size: .small, image: UIImage(named: "BlackHoodie")!),
        Item(name: "Dark Grey Unisex Hoodie", price: .hoodies, color: .darkGray, size: .small, image: UIImage(named: "DarkGreyHoodie")!),
        Item(name: "Green Unisex Hoodie", price: .hoodies, color: .greenHoodie, size: .small, image: UIImage(named: "GreenHoodie")!),
        Item(name: "Light Grey Unisex Hoodie", price: .hoodies, color: .lightGray, size: .small, image: UIImage(named: "LightGreyHoodie")!),
        Item(name: "Magenta Unisex Hoodie", price: .hoodies, color: .mangentaPurple, size: .small, image: UIImage(named: "MagentaHoodie")!),
        Item(name: "Navy Blue Unisex Hoodie", price: .hoodies, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueHoodie")!),
        Item(name: "Pink Unisex Hoodie", price: .hoodies, color: .customPinkHoodie, size: .small, image: UIImage(named: "PinkHoodie")!),
        Item(name: "Plum Unisex Hoodie", price: .hoodies, color: .plum, size: .small, image: UIImage(named: "PlumHoodie")!),
        Item(name: "Royal Blue Unisex Hoodie", price: .hoodies, color: .blue, size: .small, image: UIImage(named: "RoyalBlueHoodie")!),
        Item(name: "Tan Unisex Hoodie", price: .hoodies, color: .tan, size: .small, image: UIImage(named: "TanHoodie")!),
        
        Item(name: "Black Unisex Sweatshirt", price: .sweatShirts, color: .black, size: .small, image: UIImage(named: "BlackSweatshirt")!),
        Item(name: "Cyan Unisex Sweatshirt", price: .sweatShirts, color: .cyanBlue, size: .small, image: UIImage(named: "CyanSweatshirt")!),
        Item(name: "Green Unisex Sweatshirt", price: .sweatShirts, color: .customGreenSweatshirt, size: .small, image: UIImage(named: "GreenSweatshirt")!),
        Item(name: "Navy Blue Unisex Sweatshirt", price: .sweatShirts, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueSweatshirt")!),
        Item(name: "Pink Unisex Sweatshirt", price: .sweatShirts, color: .customPinkSweatshirt, size: .small, image: UIImage(named: "PinkSweatshirt")!),
        Item(name: "Plum Unisex Sweatshirt", price: .sweatShirts, color: .plum, size: .small, image: UIImage(named: "PlumSweatshirt")!),
        
        Item(name: "Black Ankle Socks", price: .socks, color: .black, size: .small, image: UIImage(named: "BlackAnkleSocks")!),
        Item(name: "Light Grey Ankle Socks", price: .socks, color: .customLightGrey, size: .small, image: UIImage(named: "LightGreyAnkleSocks")!),
        Item(name: "White Ankle Socks", price: .socks, color: .white, size: .small, image: UIImage(named: "WhiteAnkleSocks")!),
        Item(name: "Orange Long Socks", price: .socks, color: .customOrange, size: .small, image: UIImage(named: "OrangeLongSocks")!),
        Item(name: "Pink Long Socks", price: .socks, color: .customNeonPink, size: .small, image: UIImage(named: "PinkLongSocks")!),
        Item(name: "Yellow Long Socks", price: .socks, color: .customYellow, size: .small, image: UIImage(named: "YellowLongSocks")!),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: .customLightGrey, size: .small, image: UIImage(named: "LightGreyNoShowSocks")!),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: .customLightGrey, size: .small, image: UIImage(named: "LightGreyNoShowSocks")!),
        Item(name: "Navy Blue No-Show Socks", price: .socks, color: .navyBlue, size: .small, image: UIImage(named: "NavyBlueNoShowSocks")!),
        Item(name: "Taupe No-Show Socks", price: .socks, color: .taupe, size: .small, image: UIImage(named: "TaupeNoShowSocks")!),
        
        
        Item(name: "Black Tote Bag", price: .toteBags, color: .black, image: UIImage(named: "BlackToteBag")!),
        Item(name: "Burnt Yellow Tote Bag", price: .toteBags, color: .burntYellow, image: UIImage(named: "BurntYellowToteBag")!),
        Item(name: "Light Pink Tote Bag", price: .toteBags, color: .lightPink, image: UIImage(named: "LightPinkToteBag")!),
        Item(name: "Tan Tote Bag", price: .toteBags, color: .tan, image: UIImage(named: "TanToteBag")!),
        Item(name: "White Tote Bag", price: .toteBags, color: .white, image: UIImage(named: "WhiteToteBag")!),
    ]
}



