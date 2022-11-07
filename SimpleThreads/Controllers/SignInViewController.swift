//
//  SignInViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/24/22.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.configureTextField(withIcon: Icons.email, placeHolder: "Email")
            print("Did set")
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.configureTextField(withIcon: Icons.password, placeHolder: "Password")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did Load")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInTapped(_ sender: UIButton) {
    }    
    
}
