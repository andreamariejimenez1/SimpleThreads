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
    @IBOutlet weak var checkOutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        checkOutButton.configuration?.baseBackgroundColor = .black
        selectionStyle = .none
    }
    
    @IBAction func didTapCheckout(_ sender: Any) {
    }
    
    
    func configure(with cart: Cart) {
        subTotal.text = cart.subTotal
        total.text = cart.total
        tax.text = cart.taxTotal
        shipping.text = cart.shippingCost
    }
}
