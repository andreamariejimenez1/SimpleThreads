//
//  CartTotalsCell.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/2/23.
//

import UIKit

class CartTotalsCell: UITableViewCell {

    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var shipping: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var total: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        selectionStyle = .none
    }
    
    func configure(with cart: Cart) {
        subTotal.text = cart.subTotal
        total.text = cart.total
    }
}
