//
//  ShopTableViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import Foundation
import UIKit

class ShopTableViewCell: UITableViewCell, Configureable {
    
    
    @IBOutlet weak var productCategory: UILabel!
    
    func configure(with item: Item) {
        productCategory.text = item.category?.getTitle()
    }
    
    func configure(with category: Category) {
        productCategory.text = category.getTitle()
    }
}
