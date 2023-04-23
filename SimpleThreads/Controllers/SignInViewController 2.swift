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
        
        //TODO: Add logic to only post the notification when the users credentials has been verified
        
        // Create a post the showHomeScreen notification to the apps notification center
        // For now, this is better practice than using segues everywhere
        NotificationCenter.default.post(name: Notifications.showHome, object: nil)
    }
    
    // MARK: - Destination Segues and unwind Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.unwindToWelcome {
            let destinationVC = segue.destination as? WelcomeViewController
            destinationVC?.fromSignIn = true
        }
    }
    
}
