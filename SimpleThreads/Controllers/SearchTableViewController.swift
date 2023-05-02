//
//  SearchTableViewController.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/2/23.
//

import UIKit

class SearchTableViewController: UIViewController {
    
    var searchText = "" {
        didSet {
            createNewSnapshot(with: searchText)
        }
    }
    
    enum Section {
        case main
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
         return tableView
    }()
    
    var datasource: UITableViewDiffableDataSource<Section, Item>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        installConstraints()
        setupDatasource()
        applyInitialSnapshot()
    }
    
    private func installConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Setup Diffable Datasource
extension SearchTableViewController {
    
    private func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        let items = [Item]()
        snapshot.appendItems(items)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
    private func setupDatasource() {
        datasource = UITableViewDiffableDataSource<Section, Item>(tableView: tableView, cellProvider: { tableView, indexPath, item in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.name
            cell.contentConfiguration = configuration
            return cell
        })
        
        datasource.defaultRowAnimation = .fade
    }
    
    private func createNewSnapshot(with text: String) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        let items = DataStore.items.filter { item in
            item.name.lowercased().contains(text.lowercased())
        }
        snapshot.appendItems(items)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension SearchTableViewController: UITableViewDelegate {
    
}
