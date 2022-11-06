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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        var charIndex = 0
        let titleText = "👕T-Shirt Zone"
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        // Do any additional setup after loading the view.
    }

}
