//
//  CartCell.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/1/23.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
         Hard code the height of the cell based on the story board, this is not ideal but just faster.
         In a real world app the would need to be determined the by the elements in the cell using more
         constraints
         */
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        selectionStyle = .none
    }
    
    func configure(with item: Item) {
        Task {
            let image = try? await ImageLoader.shared.fetchImage(from: item.image)
            productImage.image = image
            productNameLabel.text = item.name
            productPrice.text = NumberFormatter.localizedString(from: item.price.rawValue as NSNumber, number: .currency)
        }
    }
}
