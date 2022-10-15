//
//  ShopViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 9/28/22.
//

import UIKit

class ShopViewController: UIViewController {
    
    var shirtTitle = "Shirt"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButton() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Home")
        vc.view.backgroundColor = .systemPink
        vc.title = shirtTitle
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
