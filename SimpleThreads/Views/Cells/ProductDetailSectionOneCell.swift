//
//  ProductDetailSectionOneCell.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/9/23.
//

import UIKit

class ProductDetailSectionOneCell: UITableViewCell, Configureable {
    

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
         Hard code the height of the cell based on the story board, this is not ideal but just faster.
         In a real world app the would need to be determined the by the elements in the cell using more
         constraints
         */
        self.heightAnchor.constraint(equalToConstant: 560).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: Item) {
        Task {
            let image = try? await ImageLoader.shared.fetchImage(from: item.image)
            productImageView.image = image
            productNameLabel.text = item.name
            productNameLabel.text = item.name
            priceLabel.text = NumberFormatter.localizedString(from: item.price.rawValue as NSNumber, number: .currency)
        }
    }
}
