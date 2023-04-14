//
//  EditNameViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import UIKit

class EditNameViewController: UIViewController {
    
    var firstName: String?
    var lastName: String?
    
    @IBOutlet weak var firstNameTextField: UITextField! {
        didSet {
            firstNameTextField.configureTextField(withIcon: Icons.person, placeHolder: "First Name")
        }
    }
    
    @IBOutlet weak var lastNameTextField: UITextField! {
        didSet {
            lastNameTextField.configureTextField(withIcon: Icons.person, placeHolder: "Last Name")
        }
    }
    
    @IBOutlet weak var saveNameButton: UIButton! {
        didSet {
            saveNameButton.layer.cornerRadius = 12
            saveNameButton.tintColor = .appColor
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        self.title = "Edit Name"
        firstNameTextField.becomeFirstResponder()
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

extension EditNameViewController: UITextFieldDelegate {
    
}
