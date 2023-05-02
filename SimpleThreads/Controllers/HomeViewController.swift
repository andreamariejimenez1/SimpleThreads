//  ViewController.swift
//  SimpleThreads
//  Created by Andrea Jimenez on 9/28/22

import UIKit
import FirebaseFirestore
import FirebaseStorage
import SkeletonView

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    var retrievedImages = [UIImage]()
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var shoppingCartButton: UIButton!

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
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        configureBadge()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reconfigureBadge()
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
    
    private func reconfigureBadge() {
        let count = DataStore.cart.items.count
        badge.text = String(count)
        badge.isHidden = count == 0
    }
    
    // MARK: - IBAction
    @IBAction func onTapCartButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let cartViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllers.cartVC)
        navigationController?.pushViewController(cartViewController, animated: true)
    }
    
    // Search button
    @IBAction func onTap(_ sender: Any) {
        // Navigate to shop tab
        self.tabBarController?.selectedIndex = 1
    }
}


// MARK: - UICollectionView Datasource
extension HomeViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "cell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStore.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.collectionView , for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        let item = DataStore.items[indexPath.item]
        Task {
            await collectionCell.configure(with: item)
        }
        return collectionCell
    }
    
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStore.items.count
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell? {
        guard let collectionCell = skeletonView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.collectionView , for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        let item = DataStore.items[indexPath.item]
        
        Task {
            await collectionCell.configure(with: item)
        }
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

extension HomeViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        
    }
}

// MARK: - Collection View Delegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = DataStore.items[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let productDetailViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else { return }
        productDetailViewController.item = product
        productDetailViewController.delegate = self
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}

// MARK: - Product Detail View Controller Delegate
extension HomeViewController: ProductDetailViewControllerDelegate {
    func didAddItemToBag() {
        reconfigureBadge()
    }
}

