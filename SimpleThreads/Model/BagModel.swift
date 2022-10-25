//
//  BagModel.swift
//  SimpleThreads
//
//  Created by RODERICK SIMMS on 10/25/22.
//

import Foundation

struct BagModel: Identifiable {
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

extension BagModel {
    static func all() -> [BagModel] {
        return [
            BagModel(itemName:"Black Shirt", itemDescription:"Black top, has a v-neck collar, short sleeves and is available in different sizes for men and women.", itemImage: "basicTee", itemPrice: 2399, itemQuantity: 1, itemType:"sale", isFavorite: true, itemColor: "Black", itemSize:"M"),
            BagModel(itemName:"White Tee", itemDescription:"White top,has a v-neck collar, short sleeves and is available in different sizes for men and women.", itemImage: "printTee", itemPrice: 3449, itemQuantity: 1, itemType: "sale", isFavorite: true, itemColor: "White", itemSize: "M"),
            BagModel(itemName:"Print Tee", itemDescription:"White top,has a round neck, short sleeves,screen printed pattern on front.", itemImage: "printTee", itemPrice: 3449, itemQuantity: 1, itemType: "sale", isFavorite: true, itemColor: "White", itemSize: "M")
        ]
    }
}
