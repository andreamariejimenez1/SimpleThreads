//
//  ProductCollectionViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/13/22.
//

import UIKit
import AlamofireImage
import SkeletonView

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        productNameLabel.text = ""
    }
    
    func configure(with item: Item) async {
        Task {
            let image = try? await ImageLoader.shared.fetchImage(from: item.image)
            productImage.image = image
            productNameLabel.text = item.name
        }
    }
}
