//
//  CategorySelectionViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 9/28/22.
//

import UIKit

class CategorySelectionViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
}

// MARK: - TableView Datasource
extension CategorySelectionViewController: UITableViewDataSource {
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

extension CategorySelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryTableView.deselectRow(at: indexPath, animated: true)
    
        let category = Category(rawValue: indexPath.row)
        // pass this to a generic collection view
        
        if category == .all {
            // just show collection view with all of sample data
            let collectionViewController = ProductCollectionsViewController(items: DataStore.items)
            navigationController?.pushViewController(collectionViewController, animated: true)
        } else {
            let dataToDisplay = DataStore.items.filter { $0.category == category }
            // pass data to collection to display
            let collectionViewController = ProductCollectionsViewController(items: dataToDisplay)
            print(dataToDisplay)
            navigationController?.pushViewController(collectionViewController, animated: true)
        }
    }
}
