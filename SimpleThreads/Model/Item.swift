//
//  Product.swift
//  SimpleThreads
//
//  Created by Ahmet Bilici on 10/15/22.
//  Modified by Roderick Simms on 10/25/22.
//


import Foundation

struct Item: Identifiable {
    let id = UUID()
    let itemName: String
    let itemDescription: String
    let itemImage: String
    let itemPrice: Int
    let itemQuantity: Int
    let itemType: String
    let isFavorite: Bool
    let itemColor: String
    let itemSize: String
}

extension Item {
    
    static func all() -> [Item] {
        return [
            Item(itemName:"Black Shirt", itemDescription:"Black top, has a v-neck collar, short sleeves and is available in different sizes for men and women.", itemImage: "basicTee", itemPrice: 2399, itemQuantity: 1, itemType:"sale", isFavorite: true, itemColor: "Black", itemSize:"M"),
            Item(itemName:"White Tee", itemDescription:"White top,has a v-neck collar, short sleeves and is available in different sizes for men and women.", itemImage: "printTee", itemPrice: 3449, itemQuantity: 1, itemType: "sale", isFavorite: true, itemColor: "White", itemSize: "M"),
            Item(itemName:"Print Tee", itemDescription:"White top,has a round neck, short sleeves,screen printed pattern on front.", itemImage: "printTee", itemPrice: 3449, itemQuantity: 1, itemType: "sale", isFavorite: true, itemColor: "White", itemSize: "M"),
        ]
    }
}
