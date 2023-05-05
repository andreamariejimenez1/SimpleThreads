//
//  CategorySelectionViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 9/28/22.
//

import UIKit

class CategorySelectionViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var shoppingCartButton: UIButton!
    
    lazy var searchController: UISearchController  = {
        let searchController = UISearchController(searchResultsController: SearchTableViewController())
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search SimpleThreads"
        return searchController
    }()
    
    private let badge: UILabel = {
        let badgeCount = UILabel()
        badgeCount.translatesAutoresizingMaskIntoConstraints = false
        badgeCount.layer.cornerRadius = badgeCount.frame.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.backgroundColor = .systemRed
        badgeCount.text = String(DataStore.cart.items.count)
        return badgeCount
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        navigationItem.searchController = searchController
        UISearchBar.appearance().tintColor = .black
        configureBackButton()
        configureBadge()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        badge.text = String(DataStore.cart.items.count)
        configureBadge()
    }
    
    private func configureBackButton() {
        let backItem = UIBarButtonItem()
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
    }
    
    private func configureBadge() {
        shoppingCartButton.addSubview(badge)
        shoppingCartButton.bringSubviewToFront(badge)
        
        NSLayoutConstraint.activate([
            badge.centerXAnchor.constraint(equalTo: shoppingCartButton.rightAnchor, constant: -10),
            badge.centerYAnchor.constraint(equalTo: shoppingCartButton.topAnchor, constant: 10),
            badge.widthAnchor.constraint(equalToConstant: 20),
            badge.heightAnchor.constraint(equalToConstant: 20)
        ])
        badge.layer.cornerRadius = 20 / 2
        hideBadgeIfNeeded()
    }
    
    private func hideBadgeIfNeeded() {
        badge.isHidden = DataStore.cart.items.count == 0
    }
    
    @IBAction func didSelectSearch(_ sender: UIButton) {
        searchController.searchBar.becomeFirstResponder()
    }
    
    @IBAction func didSelectCart(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let cartViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllers.cartVC)
        navigationController?.pushViewController(cartViewController, animated: true)
        
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

extension CategorySelectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        guard let searchTableView = searchController.searchResultsController as? SearchTableViewController else { return }
        searchTableView.searchText = text
    }
}

extension CategorySelectionViewController: UISearchControllerDelegate {
    
}
