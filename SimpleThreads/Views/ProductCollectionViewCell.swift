//
//  ProductCollectionViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/13/22.
//

import UIKit
import AlamofireImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    func configure(with item: Item) {
        guard let imageURL = URL(string: item.image) else { return }
        productImage.af.setImage(withURL: imageURL)
        productNameLabel.text = item.name
    }
}
