//
//  ProductDetailViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/13/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // This need to be set first before pushing onto navigation controller
    var item: Item? = nil

    @IBOutlet weak var productDetailTableView: UITableView!
    
    @IBAction func addToBagTapped(_ sender: UIButton) {
        print("pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = item?.name
        productDetailTableView.dataSource = self
        productDetailTableView.delegate = self
        productDetailTableView.rowHeight = UITableView.automaticDimension
        productDetailTableView.allowsSelection = false
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 23)
        let cartImage = UIImage(systemName: "cart.circle.fill", withConfiguration: imageConfig)
        let navItem = UIBarButtonItem(image: cartImage, style: .plain, target: nil, action: nil)
        navItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black,
                                        NSAttributedString.Key.backgroundColor : UIColor.tertiaryLabel], for: .normal)
        navigationItem.setRightBarButton(navItem, animated: true)
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
        guard let sectionOneCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productionDetailSectionOne, for: indexPath) as? ProductDetailSectionOneCell else { return UITableViewCell() }
        guard let sectionTwoCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productionDetailSectionTwo, for: indexPath) as? ProductDetailSectionTwoCell else { return UITableViewCell() }
        guard let sectionThreeCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productionDetailSectionThree, for: indexPath) as? ProductDetailSectionThreeCell else { return UITableViewCell() }
        
            /*
             If we had used programmatic UI we could simply create a protocol that with set the cell
             identifier by using String(describing: self) and called the configure method a single time
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

// MARK: - TableView Delegate
extension ProductDetailViewController: UITableViewDelegate {
    
}
