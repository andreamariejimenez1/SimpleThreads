//  ViewController.swift
//  SimpleThreads
//  Created by Andrea Jimenez on 9/28/22

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredCollectionView.dataSource = self
        navigationItem.searchController = searchController
        searchController.searchBar.isHidden = true
    }
    
    @IBAction func onTap(_ sender: Any) {
        searchController.isActive = true
        searchController.searchBar.isHidden = false
    }
}

// Collection View Datasource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // cell.layer.cornerRadius = 25
        return cell
    }
    
    // Setup header for collection view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let featuredHeaderview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "featuredHeader", for: indexPath)
            return featuredHeaderview
        } else {
            return UICollectionReusableView()
        }
    }
}

