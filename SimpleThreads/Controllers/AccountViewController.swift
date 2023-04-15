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
        // Do any additional setup after loading the view.
    }

}

extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountInformation.accountSampleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let accountCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.accountTableViewCell, for: indexPath) as? AccountTableViewCell else { return UITableViewCell() }
        
        let item = AccountInformation.accountSampleData[indexPath.item]
        accountCell.configure(with: item)
        print(item)
        
        return accountCell
    }

}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print("The following cell was selected/tapped -> \(indexPath.row)")
        
        let accountCellIndex = indexPath.row
        
        switch accountCellIndex {
        case 0:
            print("The following cell was selected/tapped -> \(accountCellIndex)")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let editNameViewController = storyboard.instantiateViewController(withIdentifier: "EditNameViewController") as? EditNameViewController else { return }
            navigationController?.pushViewController(editNameViewController, animated: true)
        case 1:
            print("The following cell was selected/tapped -> \(accountCellIndex)")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let editEmailViewController = storyboard.instantiateViewController(withIdentifier: "EditEmailViewController") as? EditEmailViewController else { return }
            navigationController?.pushViewController(editEmailViewController, animated: true)
        case 2:
            print("The following cell was selected/tapped -> \(accountCellIndex)")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let editPasswordViewController = storyboard.instantiateViewController(withIdentifier: "EditPasswordViewController") as? EditPasswordViewController else { return }
            navigationController?.pushViewController(editPasswordViewController, animated: true)
        default:
            print("Error? ")
        }
        
        

    }
    
}
