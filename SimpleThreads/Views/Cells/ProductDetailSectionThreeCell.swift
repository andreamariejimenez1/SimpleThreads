//
//  ProductDetailSectionThreeCell.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/9/23.
//

import UIKit

class ProductDetailSectionThreeCell: UITableViewCell, Configureable {
    
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet var sizeButtons: [UIButton]!
    @IBOutlet weak var addToBagButton: UIButton!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*
         Hard code the height of the cell based on the story board, this is not ideal but just faster.
         In a real world app the would need to be determined the by the elements in the cell using more
         constraints
         */
        self.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSelectSize(_ sender: UIButton) {
        // Haptic feedback when user selects size like in Lululemon
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        sender.configuration?.baseForegroundColor = .white
        sender.configuration?.baseBackgroundColor = .black
        
        for button in sizeButtons where button.titleLabel?.text != sender.titleLabel?.text {
            button.configuration?.baseForegroundColor = .black
            button.configuration?.baseBackgroundColor = .white
        }
    }
    
    func configure(with item: Item) {
        productDescriptionLabel.text = item.description
        addToBagButton.configuration?.baseBackgroundColor = .black
    }
    
    @IBAction func didAddToBad(_ sender: UIButton) {
        print("Button tapped")
    }
}
