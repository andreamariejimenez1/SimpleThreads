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

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var price: Price
    var color: UIColor?
    var size: Size?
    var inStock: Bool = true
    var description: String?
    var image: String
    var category: Category?
    
    static let sampleData = [
        
        // Womens Shirts :
        Item(name: "Women's White T-Shirt ", price: .shirts, color: .white, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807223-52bd08e9-7747-4e09-882e-09ff5759983c.jpeg", category: .womensShirt),
        Item(name: "Women's Olive Green T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807216-3644ad41-a23a-4f75-adad-4e34a534beba.jpeg", category: .womensShirt),
        Item(name: "Women's Light Pink T-Shirt", price: .shirts, color: .lightPink, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807201-13320223-68fc-4832-a65c-8cff88f36bbd.jpeg", category: .womensShirt),
        Item(name: "Women's Light Grey T-Shirt", price: .shirts, color: .lightGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807204-3bff1d22-bac2-4e77-888c-70da95da836c.jpeg", category: .womensShirt),
        Item(name: "Women's Dark Grey T-Shirt", price: .shirts, color: .darkGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807207-5caeeb5f-029b-44f5-b7fd-3cf68b9b1efc.jpeg", category: .womensShirt),
        Item(name: "Women's Charcoal T-Shirt", price: .shirts, color: .charcoal, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807214-9167ee8d-f158-4ac0-b0b9-85af0fa3458d.jpeg", category: .womensShirt),
        
        // Unisex Shirts :
        Item(name: "Unisex Olive Green T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807051-88709c60-4607-4ed7-988d-e9ef8e3804aa.jpeg", category: .unisexShirt),
        Item(name: "Unisex Ocean Blue T-Shirt", price: .shirts, color: .oceanBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807014-fbc77df2-8e00-44c3-96c1-eb7792c252bf.jpeg", category: .unisexShirt),
        Item(name: "Unisex Mint Green T-Shirt", price: .shirts, color: .mintGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807069-c94f4de7-7c15-4ccc-9001-e6b879f1aa91.jpeg", category: .unisexShirt),
        Item(name: "Unisex Light Grey T-Shirt", price: .shirts, color: .lightGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807093-d9e16d05-5d6c-4afe-b167-db188f9f0008.jpeg", category: .unisexShirt),
        Item(name: "Unisex Light Blue T-Shirt", price: .shirts, color: .lightBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807070-fc4a7e8d-7eea-4522-a9cc-77e8747381b8.jpeg", category: .unisexShirt),
        Item(name: "Unisex Indigo T-Shirt", price: .shirts, color: .indigoBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807088-eb253f78-7332-4539-9744-58aff559342d.jpeg", category: .unisexShirt),
        Item(name: "Unisex Coral T-Shirt", price: .shirts, color: .coral, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807073-f01ca687-ec18-4d0d-8f62-c2e34e33e88d.jpeg", category: .unisexShirt),
        Item(name: "Unisex Charcoal T-Shirt", price: .shirts, color: .charcoal, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807026-91e5c9f1-b04e-48a9-82c6-d55f6f2b6639.jpeg", category: .unisexShirt),
        Item(name: "Unisex Burnt Red T-Shirt", price: .shirts, color: .burntRed, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807048-60b93753-be9a-40e3-ba13-e3545873641e.jpeg", category: .unisexShirt),
        Item(name: "Unisex Burnt Orange T-Shirt", price: .shirts, color: .burntOrange, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807036-7a0658fb-231b-4735-8a41-f7985436fd44.jpeg", category: .unisexShirt),
        
        // Mens Shirt
        Item(name: "Mens Berry T-Shirt", price: .shirts, color: .berry, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806872-c6a3fdf6-c6d7-48ca-bec0-2fd37a2029ec.jpeg", category: .mensShirt),
        Item(name: "Mens Black T-Shirt", price: .shirts, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806783-bd0377d4-9cca-4c8f-aefd-5ddfcfba4328.jpeg", category: .mensShirt),
        Item(name: "Mens Coral T-Shirt", price: .shirts, color: .coral, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806723-28b6f7db-e46f-4712-b8f8-778b2a4b2bf0.jpeg", category: .mensShirt),
        Item(name: "Mens Forest Green T-Shirt", price: .shirts, color: .forestGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806877-ff9f4d85-5a8a-4848-96c7-aed69a90721d.jpeg", category: .mensShirt),
        Item(name: "Mens Gold T-Shirt", price: .shirts, color: .gold, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806821-9ee58080-9da3-4a36-b6b3-093d82eb57c6.jpeg", category: .mensShirt),
        Item(name: "Mens Navy Blue T-Shirt", price: .shirts, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806813-a04a9137-9349-476a-96a3-b7135911722c.jpeg", category: .mensShirt),
        Item(name: "Mens Royal Blue T-Shirt", price: .shirts, color: .blue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806794-ad10bcba-a34b-4010-9a94-640a4bc49d01.jpeg", category: .mensShirt),
        
        // Hoodies :
        Item(name: "Black Hoodie", price: .hoodies, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806519-c5e5f136-08a1-44da-9258-3cf107f45dc6.jpeg", category: .hoodie),
        Item(name: "Dark Grey Hoodie", price: .hoodies, color: .darkGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806532-8cda34c3-4e33-4e5f-89a8-d8b3570ecb24.jpeg", category: .hoodie),
        Item(name: "Green Hoodie", price: .hoodies, color: .greenHoodie, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806541-f27d1257-736c-4e88-bca8-f4fc65820a04.jpeg", category: .hoodie),
        Item(name: "Light Grey Hoodie", price: .hoodies, color: .lightGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806548-99d39c8d-dd3d-4e1d-b94d-8174b9724eca.jpeg", category: .hoodie),
        Item(name: "Magenta Hoodie", price: .hoodies, color: .mangentaPurple, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806570-5aeb29f3-42f4-4e22-a30f-9fc38eb8e567.jpeg", category: .hoodie),
        Item(name: "Navy Blue Hoodie", price: .hoodies, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806556-9b0c5a6f-7915-4ea4-bafc-9a7dd83bb149.jpeg”", category: .hoodie),
        Item(name: "Pink Hoodie", price: .hoodies, color: .customPinkHoodie, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806563-b4bbe2dc-e56e-4341-9221-b48b0b83015d.jpeg", category: .hoodie),
        Item(name: "Plum Hoodie", price: .hoodies, color: .plum, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806566-4db5d4cf-6da7-4c5a-9d34-3c1fad34bfec.jpeg", category: .hoodie),
        Item(name: "Royal Blue Hoodie", price: .hoodies, color: .blue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806528-8e087e4c-41c3-4fb8-890e-160bad845c19.jpeg", category: .hoodie),
        Item(name: "Tan Hoodie", price: .hoodies, color: .tan, size: .small, image: "https://user-images.githubusercontent.com/100242383/233806575-a1ff886d-c997-4cd0-b298-e010b86faf15.jpeg", category: .hoodie),
        
        Item(name: "Black Unisex Sweatshirt", price: .sweatShirts, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807548-6b765720-6930-41af-bd2d-49a81e58ee8f.jpeg", category: .sweatShirt),
        Item(name: "Cyan Unisex Sweatshirt", price: .sweatShirts, color: .cyanBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807549-1e126255-97de-44d3-a26c-f7a7a257c06c.jpeg", category: .sweatShirt),
        Item(name: "Green Unisex Sweatshirt", price: .sweatShirts, color: .customGreenSweatshirt, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807554-52df01f4-bb22-4672-9b21-5730ee445fe7.jpeg", category: .sweatShirt),
        Item(name: "Navy Blue Unisex Sweatshirt", price: .sweatShirts, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807556-c9b7c3db-3029-4fe3-9d66-39104d035722.jpeg", category: .sweatShirt),
        Item(name: "Pink Unisex Sweatshirt", price: .sweatShirts, color: .customPinkSweatshirt, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807559-4e38dfe8-3785-4e8e-ae67-70d368f23051.jpeg", category: .sweatShirt),
        Item(name: "Plum Unisex Sweatshirt", price: .sweatShirts, color: .plum, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807562-80bfd70b-b9ea-4488-bb97-474bbab9233f.jpeg", category: .sweatShirt),
        
        Item(name: "Black Ankle Socks", price: .socks, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807456-03ce4e7a-bb9d-431e-9efe-e9e6304d5532.jpeg", category: .socks),
        Item(name: "Light Grey Ankle Socks", price: .socks, color: .customLightGrey, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807460-00b2e386-f240-46c1-a953-83324b5c8965.jpeg", category: .socks),
        Item(name: "White Ankle Socks", price: .socks, color: .white, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807452-2425fb11-938b-4ea3-8502-1129847ead12.jpeg", category: .socks),
        Item(name: "Orange Long Socks", price: .socks, color: .customOrange, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807427-af2fbd26-7e5c-49f7-b354-78c96b9eb91e.jpeg", category: .socks),
        Item(name: "Pink Long Socks", price: .socks, color: .customNeonPink, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807431-6ef31da8-a220-43d4-99cb-0a7edc0600d7.jpeg", category: .socks),
        Item(name: "Yellow Long Socks", price: .socks, color: .customYellow, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807429-ae4ecb4a-74ee-4a9b-9ebc-acfc4230c187.jpeg", category: .socks),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: .customLightGrey, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807400-c5e0bc16-fdd6-4526-b60e-d0f8315492df.jpeg", category: .socks),
        Item(name: "Navy Blue No-Show Socks", price: .socks, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807395-0ed6b385-b239-4a1b-93d7-21c7700a2f1a.jpeg", category: .socks),
        Item(name: "Taupe No-Show Socks", price: .socks, color: .taupe, size: .small, image: "https://user-images.githubusercontent.com/100242383/233807402-0f3fbb1a-28ba-478f-91f6-f43a3fc72ca9.jpeg", category: .socks),
        
        
        Item(name: "Black Tote Bag", price: .toteBags, color: .black, image: "https://user-images.githubusercontent.com/100242383/233806383-73465db2-a142-4d37-89b4-da150dcbb784.jpeg", category: .totebag),
        Item(name: "Burnt Yellow Tote Bag", price: .toteBags, color: .burntYellow, image: "https://user-images.githubusercontent.com/100242383/233806343-08ae8679-3d2b-4796-9b54-d493de70d55b.jpeg", category: .totebag),
        Item(name: "Light Pink Tote Bag", price: .toteBags, color: .lightPink, image: "https://user-images.githubusercontent.com/100242383/233806318-c7a38b7f-28fb-4637-b37d-1ef3fdc663b8.jpeg", category: .totebag),
        Item(name: "Tan Tote Bag", price: .toteBags, color: .tan, image: "https://user-images.githubusercontent.com/100242383/233806279-e161799a-0ff6-456c-bda1-e36e0a235c04.jpeg", category: .totebag),
        Item(name: "White Tote Bag", price: .toteBags, color: .white, image: "https://user-images.githubusercontent.com/100242383/233806097-86cafc40-977e-40c7-9c2e-d8ba7c713a35.jpeg", category: .totebag),
    ]
}



