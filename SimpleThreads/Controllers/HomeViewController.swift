//  ViewController.swift
//  SimpleThreads
//  Created by Andrea Jimenez on 9/28/22

import UIKit
import FirebaseFirestore
import FirebaseStorage

class HomeViewController: UIViewController {
    
    var retrievedImages = [UIImage]()
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        navigationItem.searchController = searchController
        searchController.searchBar.isHidden = true
    }
    
    @IBAction func onTap(_ sender: Any) {
        searchController.isActive = true
        searchController.searchBar.isHidden = false
    }
}

// MARK: - UICollectionView Datasource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Item.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.collectionView , for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        let item = Item.sampleData[indexPath.item]
        collectionCell.configure(with: item)
        
        return collectionCell
    }
    
    // Setup header for collection view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let featuredHeaderview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellIdentifiers.collectionViewHeader, for: indexPath)
            return featuredHeaderview
        } else {
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = Item.sampleData[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let productDetailViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else { return }
        productDetailViewController.item = product
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}

