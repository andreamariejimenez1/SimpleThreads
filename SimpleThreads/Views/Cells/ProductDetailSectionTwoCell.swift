//
//  ProductDetailSectionTwoCell.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/9/23.
//

import UIKit

class ProductDetailSectionTwoCell: UITableViewCell, Configureable {
    @IBOutlet weak var colorButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        /*
         Hard code the height of the cell based on the story board, this is not ideal but just faster.
         In a real world app the would need to be determined the by the elements in the cell using more
         constraints
         */
        self.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure(with item: Item) {
        colorButton.configuration?.baseBackgroundColor = item.color
        colorButton.configuration?.background.strokeColor = .lightGray
        colorButton.configuration?.background.strokeWidth = 2
        colorButton.configuration?.background.strokeOutset = 4.0
    }
}
