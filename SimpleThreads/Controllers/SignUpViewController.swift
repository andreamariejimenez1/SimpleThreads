//
//  SignUpViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/24/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var db: Firestore!
    var user: User?
    
    // MARK: - TextFields didSet
    
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
    
    // MARK: - View DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        reEnterPasswordTextField.delegate = self
        
        firstNameTextField.becomeFirstResponder()
    }
    
    // MARK: - IBActions
    
    @IBAction func createMyAccountTapped(_ sender: UIButton) {
        
        // check that none of our fields are nil using optional binding
        if let email = emailTextField.text, let password = passwordTextField.text {
            // then we create user with email and password
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let currentUser = authResult?.user, error == nil else {
                    print(error!)
                    return
                }
                // Make sure we have non nil values to create a user
                guard let firstName = self?.firstNameTextField.text, let lastName = self?.lastNameTextField.text, let email = self?.emailTextField.text else {
                    print("Problem getting user details")
                    return
                }
                
                // Create user in DB
                self?.createUserInDB(id: currentUser.uid, firstName: firstName, lastName: lastName, email: email)
            }
        }
    }
    
    // MARK: - Functions
    
    // add user info to database : first name, last name, email
    private func createUserInDB(id userID: String, firstName: String?, lastName: String?, email: String?) {
        
        let userData: [String: Any] = [
            "firstName" : firstName ?? "",
            "lastName" : lastName ?? "",
            "email" : email ?? ""
        ]
        
        // add document ???
        db.collection("users").document(userID).setData(userData) { error in
            // add user data to collection
            if let e = error {
                print("Error writing document: \(e)")
            } else {
                // once we have succesfully created a user in the DB we can navigate to the home screen
                
                // Create a post the showHomeScreen notification to the apps notification center
                // For now, this is better practice than using segues everywhere
                NotificationCenter.default.post(name: Notifications.showHome, object: nil)
                print("Document successfully written!")
            }
        }
    }    
}

// MARK: - TextField Delegates

extension SignUpViewController: UITextFieldDelegate {
    
}

// MARK: - TextField Configurations

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
