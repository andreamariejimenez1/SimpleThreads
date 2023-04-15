//
//  EditPasswordViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import UIKit

class EditPasswordViewController: UIViewController {
    
    @IBOutlet weak var currentPasswordTextField: UITextField! {
        didSet {
            currentPasswordTextField.configureTextField(withIcon: Icons.password, placeHolder: "Current Password")
        }
    }
    @IBOutlet weak var newPasswordTextField: UITextField! {
        didSet {
            newPasswordTextField.configureTextField(withIcon: Icons.password, placeHolder: "New Password")
        }
    }
                                                    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField! {
        didSet {
            confirmNewPasswordTextField.configureTextField(withIcon: Icons.password, placeHolder: "Confirm New Password")
        }
    }
                                                    

    
    @IBOutlet weak var changePasswordButton: UIButton! {
        didSet {
            changePasswordButton.layer.cornerRadius = 12
            changePasswordButton.tintColor = .appColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Change Password"

        currentPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
        
        currentPasswordTextField.becomeFirstResponder()
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

extension EditPasswordViewController: UITextFieldDelegate {
    
}
