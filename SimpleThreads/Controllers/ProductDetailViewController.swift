//
//  ProductDetailViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/13/22.
//

import UIKit

protocol ProductDetailViewControllerDelegate: AnyObject {
    func didAddItemToBag()
}

class ProductDetailViewController: UIViewController {
    
    // This need to be set first before pushing onto navigation controller
    var item: Item? = nil
    var cart: UIBarButtonItem?
    weak var delegate: ProductDetailViewControllerDelegate?

    @IBOutlet weak var productDetailTableView: UITableView!
    
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
    
    @IBAction func addToBagTapped(_ sender: UIButton) {
        DataStore.cart.items.append(item!)
        let count = DataStore.cart.items.count
        hideBadgeIfNeeded()
        badge.text = String(count)
        delegate?.didAddItemToBag()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = item?.name
        productDetailTableView.dataSource = self
        productDetailTableView.rowHeight = UITableView.automaticDimension
        productDetailTableView.allowsSelection = false
        configureNavigationBar()
        configureBackButton()
        configureBadge()
    }
    
    private func configureNavigationBar() {
        let cartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 58.67, height: 44))
        cartButton.addTarget(self, action: #selector(showCart), for: .touchUpInside)
        cartButton.configuration = .plain()
        cartButton.configuration?.baseForegroundColor = .lightGray
        cartButton.imageView?.tintColor = .black
        let imageConfig = UIImage.SymbolConfiguration(hierarchicalColor: .black)
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 23)
        let combinedConfig = imageConfig.applying(sizeConfig)
        let cartImage = UIImage(systemName: "cart.circle.fill", withConfiguration: combinedConfig)
        cartButton.setImage(cartImage, for: .normal)
        let navItem = UIBarButtonItem(customView: cartButton)
        navigationItem.setRightBarButton(navItem, animated: true)
        cart = navItem
    }
    
    private func configureBackButton() {
        let backItem = UIBarButtonItem()
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
    }
    
    private func configureBadge() {
        
        cart?.customView?.addSubview(badge)
        NSLayoutConstraint.activate([
            badge.centerXAnchor.constraint(equalTo: cart!.customView!.rightAnchor, constant: -10),
            badge.centerYAnchor.constraint(equalTo: cart!.customView!.topAnchor, constant: 10),
            badge.widthAnchor.constraint(equalToConstant: 20),
            badge.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        cart?.customView?.bringSubviewToFront(badge)
        cart?.customView?.layoutIfNeeded()
        badge.layer.cornerRadius = 20 / 2
        hideBadgeIfNeeded()
    }
    
    private func hideBadgeIfNeeded() {
        badge.isHidden = DataStore.cart.items.count == 0
    }
    
    @objc private func showCart() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let cartViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllers.cartVC)
        navigationController?.pushViewController(cartViewController, animated: true)
    }
}

// MARK: - TableView Datasource
extension ProductDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Hard coding this because there are only three cell to display
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create cell upfront and then switch on the indexPath.row to determine which cell to display
        guard let sectionOneCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productionDetailSectionOne, for: indexPath) as? Configureable else { return UITableViewCell() }
        guard let sectionTwoCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productionDetailSectionTwo, for: indexPath) as? ProductDetailSectionTwoCell else { return UITableViewCell() }
        guard let sectionThreeCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productionDetailSectionThree, for: indexPath) as? ProductDetailSectionThreeCell else { return UITableViewCell() }
        
        
        sectionThreeCell.delegate = self
        
            /*
             If we had used programmatic UI we could simply create a protocol that with set the cell
             identifier by using String(describing: self) and call the configure method a single time
             by casting to a cell that conforms to the Configurable protocol rather than casting
             to the specific cell class.
             This is just a refactor opportunity later on to maintain DRY (Don't Repeat Yourself) code.
             */
        switch indexPath.row {
        case 0:
            sectionOneCell.configure(with: item!)
            return sectionOneCell
        case 1:
            sectionTwoCell.configure(with: item!)
            return sectionTwoCell
        case 2:
            sectionThreeCell.configure(with: item!)
            return sectionThreeCell
        default:
            // return an empty cell if something goes wrong during setup
            return UITableViewCell()
        }
    }
}

// MARK: - Cell Delegate
extension ProductDetailViewController: ProductDetailSectionThreeCellDelegate {
    func didSelectSize(_ size: Size) {
        item?.size = size
    }
}
