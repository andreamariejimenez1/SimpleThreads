//
//  SignUpViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/24/22.
//

import UIKit

class SignUpViewController: UIViewController {

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
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.configureTextField(withIcon: Icons.email, placeHolder: "Email")
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.configureTextField(withIcon: Icons.password, placeHolder: "Password")
        }
    }
    @IBOutlet weak var reEnterPasswordTextField: UITextField! {
        didSet {
            reEnterPasswordTextField.configureTextField(withIcon: Icons.password, placeHolder: "Re-Enter Password")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension UITextField {
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func configureTextField(withIcon iconString: String, placeHolder text: String) {
        self.tintColor = UIColor.black
        self.setIcon(UIImage.init(systemName: "\(iconString)")!)
        self.placeholder = "\(text)"
        self.layer.borderWidth = 1.0
        self.frame.size.height = 50
        self.layer.cornerRadius = 12
    }
}
