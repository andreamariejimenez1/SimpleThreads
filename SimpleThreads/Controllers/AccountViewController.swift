//
//  UserViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 9/28/22.
//

import UIKit

class AccountViewController: UIViewController {
    
    
    @IBOutlet weak var accountTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountTableView.dataSource = self
        accountTableView.delegate = self
        configureBackButton()
    }
    
    private func configureBackButton() {
        let backItem = UIBarButtonItem()
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
    }

}

extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountInformation.accountSampleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let accountCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.accountTableViewCell, for: indexPath) as? AccountTableViewCell else { return UITableViewCell() }
        
        let item = AccountInformation.accountSampleData[indexPath.item]
        accountCell.configure(with: item, indexPath: indexPath)
        accountCell.delegate = self
        print(item)
        
        return accountCell
    }

}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print("The following cell was selected/tapped -> \(indexPath.row)")
        
        // unhighlight selected cell
        tableView.deselectRow(at: indexPath, animated: true)
        print("row selected")
    }
}

extension AccountViewController: AccountTableViewCellDelegate {
    func didTapAction(_ cell: AccountTableViewCell, didSelectButtonAt indexPath: IndexPath?) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let indexPath = indexPath else { return }
        let accountCellIndex = indexPath.row
        
        switch accountCellIndex {
        case 0:
            print("The following cell was selected/tapped -> \(accountCellIndex)")
            
            guard let editNameViewController = storyboard.instantiateViewController(withIdentifier: "EditNameViewController") as? EditNameViewController else { return }
            navigationController?.pushViewController(editNameViewController, animated: true)
        case 1:
            print("The following cell was selected/tapped -> \(accountCellIndex)")
            guard let editEmailViewController = storyboard.instantiateViewController(withIdentifier: "EditEmailViewController") as? EditEmailViewController else { return }
            navigationController?.pushViewController(editEmailViewController, animated: true)
        case 2:
            print("The following cell was selected/tapped -> \(accountCellIndex)")
            guard let editPasswordViewController = storyboard.instantiateViewController(withIdentifier: "EditPasswordViewController") as? EditPasswordViewController else { return }
            navigationController?.pushViewController(editPasswordViewController, animated: true)
        default:
            print("Error? ")
        }
    }
}
