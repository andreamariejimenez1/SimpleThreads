//
//  CartProductsViewController.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/1/23.
//

import UIKit

class CartProductsViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.separatorStyle = .none
    }
}

// MARK: - TableView Datasource
extension CartProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartCell, for: indexPath) as? CartCell else { return UITableViewCell()}
            cell.configure(with: DataStore.cart.items[indexPath.row])
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartTotalsCell, for: indexPath) as? CartTotalsCell else { return UITableViewCell()}
            cell.configure(with: DataStore.cart)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return DataStore.cart.items.count
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

// MARK: - TableView Delegate
extension CartProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
}
