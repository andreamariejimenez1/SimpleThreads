//
//  WelcomeViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/24/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBAction func logInButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signInVC = storyboard.instantiateViewController(withIdentifier: ViewControllers.signIn) as? SignInViewController else { return }
        
        let sheet = signInVC.sheetPresentationController
        sheet?.detents = [.medium()]
        
        present(signInVC, animated: true)
    }
    
    @IBAction func createAccountButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signUpVC = storyboard.instantiateViewController(withIdentifier: ViewControllers.signUp) as? SignUpViewController else { return }
        
        signUpVC.modalPresentationStyle = .automatic
        
        present(signUpVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
