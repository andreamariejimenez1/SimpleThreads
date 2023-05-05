//
//  CartProductsViewController.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/1/23.
//

import UIKit

class CartProductsViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    private lazy var emptyCartView: EmptyCartView = {
        let emptyCartView = EmptyCartView()
        emptyCartView.translatesAutoresizingMaskIntoConstraints = false
        emptyCartView.delegate = self
        return emptyCartView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cart"
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.separatorStyle = .none
        configureEmptyCartView()
        hideEmptyCartViewIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func willMove(toParent parent: UIViewController?) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func configureEmptyCartView() {
        view.addSubview(emptyCartView)
        
        NSLayoutConstraint.activate([
            emptyCartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyCartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyCartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyCartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func hideEmptyCartViewIfNeeded() {
        emptyCartView.isHidden = !DataStore.cart.items.isEmpty
        self.tabBarController?.tabBar.isHidden = DataStore.cart.items.isEmpty
    }
}

// MARK: - EmptyCartView Delegate
extension CartProductsViewController: EmptyCartViewDelegate {
    
    // When the user selects the keep looking button we will return to the shop page
    // and unhide the tabBar
    func didSelectKeepLooking(_ emptyCartView: EmptyCartView) {
        guard let tabBarController else { return }
        if tabBarController.selectedIndex == 1 {
            navigationController?.popViewController(animated: true)
        } else {
            tabBarController.selectedIndex = 1
        }
        tabBarController.tabBar.isHidden = false
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
