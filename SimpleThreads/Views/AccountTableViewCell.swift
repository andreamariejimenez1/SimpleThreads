//
//  AccountTableViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import Foundation
import UIKit

class AccountTableViewCell: UITableViewCell {
 
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var dataString: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        print("Action Button Tapped")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
         Hard code the height of the cell based on the story board, this is not ideal but just faster.
         In a real world app the would need to be determined the by the elements in the cell using more constraints
         */
        self.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    func configure(with item: AccountInformation) {
        titleName.text = item.title.rawValue
        dataString.text = item.data
    }
        
}
