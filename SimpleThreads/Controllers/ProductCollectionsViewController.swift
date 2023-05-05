//
//  ProductCollectionsViewController.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/1/23.
//

import UIKit

class ProductCollectionsViewController: UIViewController {
    
    let items: [Item]
    
    enum collectionViewSection {
        case main
    }
    
    private var productsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<collectionViewSection, Item>! = nil
    
    init(items: [Item]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.title = "items"
        
        configureHierarchy()
        configureDataSource()
        applyInitialSnapshot()
        configureBackButton()
    }
    
    // Turn back button black when pushing other view controller onto navigation stack
    private func configureBackButton() {
        let backItem = UIBarButtonItem()
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
    }
}

// MARK: - Configure Datasource
extension ProductCollectionsViewController {
    
    private func registerProductCell() -> UICollectionView.CellRegistration<CustomProductCollectionViewCell, Item> {
        return UICollectionView.CellRegistration<CustomProductCollectionViewCell, Item> { cell, indexPath, item in
            
            // Configure the look and feel of the cell in the registration rather
            // than doing this in the datasource methods (i.e. itemForRowAt etc...)
            Task {
                await cell.configureCell(with: item.image)
            }
        }
    }
    
    private func configureDataSource() {
        let productCellRegistration = registerProductCell()
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: productsCollectionView) { collectionView, indexPath, item in
            return collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
        }
    }
    
    private func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<collectionViewSection, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource.apply(snapshot)
    }
}

// MARK: - Collection View Delegate
extension ProductCollectionsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = items[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let productDetailViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else { return }
        productDetailViewController.item = product
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}

// MARK: - Create Collection View Layout
extension ProductCollectionsViewController {
    private func compositionalLayout() -> UICollectionViewLayout {
        
        let spacing = CGFloat(10)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
        view.addSubview(productsCollectionView)
        installCollectionViewConstraints()
        productsCollectionView.collectionViewLayout = compositionalLayout()
        productsCollectionView.delegate = self
    }
    
    private func installCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
