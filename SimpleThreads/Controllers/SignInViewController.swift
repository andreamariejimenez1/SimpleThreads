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
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.configureTextField(withIcon: Icons.password, placeHolder: "Password")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func logInTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
           showInvalidInput()
            return
        }
        
        FirebaseManager.shared.signInUser(email: email, password: password) { [weak self] authResult, error in
            guard error == nil else {
                guard let strongSelf = self else { return }
                strongSelf.showInvalidInput()
                return
            }
            
            // Create a post the showHomeScreen notification to the apps notification center
            // For now, this is better practice than using segues everywhere
            NotificationCenter.default.post(name: Notifications.showHome, object: nil)
        }
    }
    
    // MARK: - Destination Segues and unwind Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.unwindToWelcome {
            let destinationVC = segue.destination as? WelcomeViewController
            destinationVC?.fromSignIn = true
        }
    }
    
    private func showInvalidInput() {
        emailTextField.invalidText()
        passwordTextField.invalidText()
    }
}
