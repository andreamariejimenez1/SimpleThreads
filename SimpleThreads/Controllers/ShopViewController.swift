//
//  ShopViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 9/28/22.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.dataSource = self
        
    }
}

// MARK: - TableView Datasource
extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.categoryCell, for: indexPath) as? ShopTableViewCell else { return UITableViewCell() }
        
        if let category = Category(rawValue: indexPath.row) {
            cell.configure(with: category)
        }
        
        return cell
    }

}
