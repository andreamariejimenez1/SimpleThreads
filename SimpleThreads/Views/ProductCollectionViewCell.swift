//
//  ProductCollectionViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/13/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    func configure(with item: Item) {
        #warning("Improve UIImage rendering performance. UIImageNamed will result in a major performance hit")
        productImage.image = item.image
        productNameLabel.text = item.name
    }
}
