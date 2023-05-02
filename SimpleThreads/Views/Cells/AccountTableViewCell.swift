//
//  AccountTableViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import Foundation
import UIKit

protocol AccountTableViewCellDelegate: AnyObject {
    // This must be implemented
    func didTapAction(_ cell: AccountTableViewCell, didSelectButtonAt indexPath: IndexPath?)
}

class AccountTableViewCell: UITableViewCell {
 
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var dataString: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    weak var delegate: AccountTableViewCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
         Hard code the height of the cell based on the story board, this is not ideal but just faster.
         In a real world app the would need to be determined the by the elements in the cell using more constraints
         */
        self.heightAnchor.constraint(equalToConstant: 110).isActive = true
        selectionStyle = .none
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        delegate?.didTapAction(self, didSelectButtonAt: indexPath)
    }
    
    func configure(with item: AccountInformation, indexPath: IndexPath) {
        titleName.text = item.title.rawValue
        dataString.text = item.data
        self.indexPath = indexPath
    }
        
}
