//
//  DataStore.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/2/23.
//

import Foundation


class Cart {
    var items = [Item]()
    var tax = 0
    
    var subTotal: String {
        let price = items.map { $0.price.rawValue }.reduce(0) { $0 + $1 }
        return NumberFormatter.localizedString(from: price as NSNumber, number: .currency)
    }
    var total: String {
        let price = items.map { $0.price.rawValue }.reduce(0) { $0 + $1 }
        return NumberFormatter.localizedString(from: price as NSNumber, number: .currency)
    }
}

class DataStore {
    
    static let cart = Cart()
}

extension DataStore {
    static let items = [
        
        // Womens Shirts :
        Item(name: "Women's White T-Shirt ", price: .shirts, color: .white, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773179-b89650be-a58c-4c5f-a912-7ac49fab80dc.jpeg", category: .womensShirt),
        Item(name: "Women's Olive Green T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773177-b9504540-d032-48a9-baea-6dc4bacb074a.jpeg", category: .womensShirt),
        Item(name: "Women's Light Pink T-Shirt", price: .shirts, color: .lightPink, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773125-3b030ef9-0bd5-4086-8d7a-52641994ce61.jpeg", category: .womensShirt),
        Item(name: "Women's Light Grey T-Shirt", price: .shirts, color: .lightGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773124-63b47330-10ca-4bb8-bf01-31e8a709fd08.jpeg", category: .womensShirt),
        Item(name: "Women's Dark Grey T-Shirt", price: .shirts, color: .darkGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773172-a88be809-3487-445c-91cc-272da9f30e1b.jpeg", category: .womensShirt),
        Item(name: "Women's Charcoal T-Shirt", price: .shirts, color: .charcoal, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773173-85cb1edf-bb33-4253-9aa3-e107607ffd22.jpeg", category: .womensShirt),
        
        // Unisex Shirts :
        Item(name: "Unisex Olive Green T-Shirt", price: .shirts, color: .oliveGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773150-d0b255fe-3b55-40f0-af30-510b5eedc8ea.jpeg", category: .unisexShirt),
        Item(name: "Unisex Ocean Blue T-Shirt", price: .shirts, color: .oceanBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773156-7052d8e0-1100-4541-9b66-e56bff2ee746.jpeg", category: .unisexShirt),
        Item(name: "Unisex Mint Green T-Shirt", price: .shirts, color: .mintGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773147-b3e66b88-a59a-42b4-9923-d638a6302a26.jpeg", category: .unisexShirt),
        Item(name: "Unisex Light Grey T-Shirt", price: .shirts, color: .lightGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773135-620e67fe-d06e-4070-bc60-9786f7c5c8cd.jpeg", category: .unisexShirt),
        Item(name: "Unisex Light Blue T-Shirt", price: .shirts, color: .lightBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773142-df20aae8-fcf4-42f7-91cd-234834992eff.jpeg", category: .unisexShirt),
        Item(name: "Unisex Indigo T-Shirt", price: .shirts, color: .indigoBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773137-1f1ec775-ad36-465a-80ef-711c2b30fdeb.jpeg", category: .unisexShirt),
        Item(name: "Unisex Coral T-Shirt", price: .shirts, color: .coral, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773140-b56508b7-469f-47fe-8102-7952b47f277f.jpeg", category: .unisexShirt),
        Item(name: "Unisex Charcoal T-Shirt", price: .shirts, color: .charcoal, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773153-9889b06a-9d39-48ed-9424-6114f7092162.jpeg", category: .unisexShirt),
        Item(name: "Unisex Burnt Red T-Shirt", price: .shirts, color: .burntRed, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773151-da277b5c-c1c0-45a5-a777-87cebc62e9b3.jpeg", category: .unisexShirt),
        Item(name: "Unisex Burnt Orange T-Shirt", price: .shirts, color: .burntOrange, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773152-39d6e855-f067-4c76-ba17-fe90ebba9b2b.jpeg", category: .unisexShirt),
        
        // Mens Shirt
        Item(name: "Mens Berry T-Shirt", price: .shirts, color: .berry, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773115-4aa8ebfd-115d-4942-9333-17dc563c79f0.jpeg", category: .mensShirt),
        Item(name: "Mens Black T-Shirt", price: .shirts, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773158-32b77380-71c9-4a4b-876b-2434a029c7a7.jpeg", category: .mensShirt),
        Item(name: "Mens Coral T-Shirt", price: .shirts, color: .coral, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773159-59c9e296-d19d-4144-ab0c-f0658f63e760.jpeg", category: .mensShirt),
        Item(name: "Mens Forest Green T-Shirt", price: .shirts, color: .forestGreen, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773119-0d1b572a-a032-47a3-8a9c-a0d5ac48b2bd.jpeg", category: .mensShirt),
        Item(name: "Mens Gold T-Shirt", price: .shirts, color: .gold, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773114-fe152237-6373-482f-97fc-eecfc3b76296.jpeg", category: .mensShirt),
        Item(name: "Mens Navy Blue T-Shirt", price: .shirts, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773121-f17e00af-aeec-4d82-97b5-7ab0d2cf6f46.jpeg", category: .mensShirt),
        Item(name: "Mens Royal Blue T-Shirt", price: .shirts, color: .blue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773157-3fedb7c6-2022-4d00-b0ec-5a14b53910df.jpeg", category: .mensShirt),
        
        // Hoodies :
        Item(name: "Black Hoodie", price: .hoodies, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773192-9d846870-311d-47f3-8629-6a3e4051eeb9.jpeg", category: .hoodie),
        Item(name: "Dark Grey Hoodie", price: .hoodies, color: .darkGray, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773105-bc14d830-a259-4b30-97cc-5452c5857043.jpeg", category: .hoodie),
        Item(name: "Green Hoodie", price: .hoodies, color: .greenHoodie, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773100-4504dba7-bcc6-481f-a91a-6ed1227510f9.jpeg", category: .hoodie),
        Item(name: "White Hoodie", price: .hoodies, color: .white, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773191-3e793b0f-7c73-4729-ab05-83de3abc2524.jpeg", category: .hoodie),
        Item(name: "Magenta Hoodie", price: .hoodies, color: .mangentaPurple, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773094-9880a0e7-b980-42c5-9926-5e85a3173847.jpeg", category: .hoodie),
        Item(name: "Navy Blue Hoodie", price: .hoodies, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773092-51d0bf35-7f6f-4517-8004-cc225dc59a1c.jpeg", category: .hoodie),
        Item(name: "Pink Hoodie", price: .hoodies, color: .customPinkHoodie, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773096-1bcf36a6-181f-4c10-88fe-611a4d499faf.jpeg", category: .hoodie),
        Item(name: "Plum Hoodie", price: .hoodies, color: .plum, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773098-4bf78557-7c4d-455c-a7c1-e650f6619467.jpeg", category: .hoodie),
        Item(name: "Royal Blue Hoodie", price: .hoodies, color: .blue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773103-012a05df-8d92-4bd4-972d-b64534330622.jpeg", category: .hoodie),
        Item(name: "Tan Hoodie", price: .hoodies, color: .tan, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773091-cd37b649-de25-406b-9cf5-72530efa8898.jpeg", category: .hoodie),
        
        Item(name: "Black Unisex Sweatshirt", price: .sweatShirts, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773200-c87293e8-d219-4df6-86ac-c93e7cc44bb6.jpeg", category: .sweatShirt),
        Item(name: "Cyan Unisex Sweatshirt", price: .sweatShirts, color: .cyanBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773187-6a6f334d-6a6d-444e-9ea6-37eba3b7e74b.jpeg", category: .sweatShirt),
        Item(name: "Green Unisex Sweatshirt", price: .sweatShirts, color: .customGreenSweatshirt, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773195-3a0d32cb-1a4c-4e2c-9f30-ad6a8e17de8e.jpeg", category: .sweatShirt),
        Item(name: "Navy Blue Unisex Sweatshirt", price: .sweatShirts, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773199-1d8a0fc2-b27d-4356-85e9-c34a38314678.jpeg", category: .sweatShirt),
        Item(name: "Pink Unisex Sweatshirt", price: .sweatShirts, color: .customPinkSweatshirt, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773189-b28e5622-d09e-48f3-9c97-8b3a122af281.jpeg", category: .sweatShirt),
        Item(name: "Plum Unisex Sweatshirt", price: .sweatShirts, color: .plum, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773181-99f358b1-e2b2-44e0-b617-13f400012b68.jpeg", category: .sweatShirt),
        
        Item(name: "Black Ankle Socks", price: .socks, color: .black, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773087-3b6f3089-b94b-46cb-9349-757ee2c1c331.jpeg", category: .socks),
        Item(name: "Light Grey Ankle Socks", price: .socks, color: .customLightGrey, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773084-3e4f1ee1-b993-46f3-83b8-b66ae98ead71.jpeg", category: .socks),
        Item(name: "White Ankle Socks", price: .socks, color: .white, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773107-9059a004-d2ad-48dc-9651-62af25625cfe.jpeg", category: .socks),
        Item(name: "Orange Long Socks", price: .socks, color: .customOrange, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773168-54c6426c-f323-4d60-a5b4-4149f9b44405.jpeg", category: .socks),
        Item(name: "Pink Long Socks", price: .socks, color: .customNeonPink, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773163-2e902ca2-09c6-4c80-93fe-32962e057af0.jpeg", category: .socks),
        Item(name: "Yellow Long Socks", price: .socks, color: .customYellow, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773165-d40de77c-07cf-4edb-8a77-1377112a7850.jpeg", category: .socks),
        Item(name: "Light Grey No-Show Socks", price: .socks, color: .customLightGrey, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773112-a234ad0b-612c-4f84-952c-381c65ef46cf.jpeg", category: .socks),
        Item(name: "Navy Blue No-Show Socks", price: .socks, color: .navyBlue, size: .small, image: "https://user-images.githubusercontent.com/100242383/235773113-4fdfaa37-bc80-4fe2-91c4-4479b8223425.jpeg", category: .socks),
        Item(name: "Taupe No-Show Socks", price: .socks, color: .taupe, size: .small, image: "](https://user-images.githubusercontent.com/100242383/235773108-540abf1e-9129-4ef8-915f-5d3d2cb725e2.jpeg", category: .socks),
        
        
        Item(name: "Black Tote Bag", price: .toteBags, color: .black, image: "https://user-images.githubusercontent.com/100242383/235773122-41c27d67-5d36-4a09-9bd7-cfbad9c4885e.jpeg", category: .totebag),
        Item(name: "Burnt Yellow Tote Bag", price: .toteBags, color: .burntYellow, image: "https://user-images.githubusercontent.com/100242383/235773126-b186b5b9-1977-4768-9a9c-e69bdb41bcbc.jpeg", category: .totebag),
        Item(name: "Light Pink Tote Bag", price: .toteBags, color: .lightPink, image: "https://user-images.githubusercontent.com/100242383/235773130-a484a77f-f431-49d9-8be7-9d826f6e7c0f.jpeg", category: .totebag),
        Item(name: "Tan Tote Bag", price: .toteBags, color: .tan, image: "https://user-images.githubusercontent.com/100242383/235773132-9e481a1a-2610-4b48-842f-f0f0fab286f2.jpeg", category: .totebag),
        Item(name: "White Tote Bag", price: .toteBags, color: .white, image: "https://user-images.githubusercontent.com/100242383/235773129-7afd0633-df3f-4468-bcc3-6a1202fd51a3.jpeg", category: .totebag),
    ]
}
