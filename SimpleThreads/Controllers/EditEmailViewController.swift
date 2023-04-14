//
//  EditEmailViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import UIKit

class EditEmailViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.configureTextField(withIcon: Icons.email, placeHolder: "New Email")
        }
    }
    
    @IBOutlet weak var saveEmailButton: UIButton! {
        didSet {
            saveEmailButton.layer.cornerRadius = 12
            saveEmailButton.tintColor = .appColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Email"
        emailTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EditEmailViewController: UISearchTextFieldDelegate {
    
}
