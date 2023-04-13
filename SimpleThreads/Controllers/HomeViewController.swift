//  ViewController.swift
//  SimpleThreads
//  Created by Andrea Jimenez on 9/28/22

import UIKit
import FirebaseFirestore
import FirebaseStorage

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    var retrievedImages = [UIImage]()
    var badgeText: String = "+"
    let searchController = UISearchController()
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var shoppingCartButton: UIButton!
    
    
    // MARK: - Creating a badge (UILabel) for cart button
    let badgeSize: CGFloat = 20
    let badgeTag = 100

    // Configuration
    func badgeLabel(with text: String) -> UILabel {
        let badgeCount = UILabel(frame: CGRect(x: 0, y: 0, width: badgeSize, height: badgeSize))
        badgeCount.translatesAutoresizingMaskIntoConstraints = false
        badgeCount.tag = badgeTag
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.backgroundColor = .systemRed
        badgeCount.text = badgeText
        return badgeCount
    }

    // Adding the badge on top of cart button
    func showBadge(with text: String) {
        let badge = badgeLabel(with: badgeText)
        shoppingCartButton.addSubview(badge)

        // cart button needs to be behind the badge
        if let superview = shoppingCartButton.superview {
            superview.addSubview(badge)
            superview.bringSubviewToFront(badge)

            NSLayoutConstraint.activate([
                badge.centerXAnchor.constraint(equalTo: shoppingCartButton.rightAnchor, constant: -10),
                badge.centerYAnchor.constraint(equalTo: shoppingCartButton.topAnchor, constant: 10),
                badge.widthAnchor.constraint(equalToConstant: badgeSize),
                badge.heightAnchor.constraint(equalToConstant: badgeSize)
            ])
        }
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        navigationItem.searchController = searchController
        searchController.searchBar.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction func onTapCartButton(_ sender: UIButton) {
        
        // this is where we perform segue
        
        // the following code is for debugging purposes and make sure the badge is working properly
        print("Cart Button Tapped")
        showBadge(with: badgeText)
    }
    
    // Search button
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

// MARK: - HomeViewController Extension

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = Item.sampleData[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let productDetailViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else { return }
        productDetailViewController.item = product
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}

