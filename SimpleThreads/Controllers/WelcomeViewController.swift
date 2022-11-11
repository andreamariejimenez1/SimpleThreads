//
//  WelcomeViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/24/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // Variable to track when we show the WelcomeViewController from the signInViewController
    // This is defaulted to false and only set to true when the user pressed "Create account"
    // from the signInViewController
    var fromSignIn = false

    
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Because signIn is a half sheet, viewDidAppear is only called once so this block won't
        // get evaluated after the signIn View Controller is dismissed by the unwind segue
        // TODO: Figure out a different way to notify the app that it needs to show the signUp View controller
        if fromSignIn {
            performSegue(withIdentifier: Segues.signupSegue, sender: self)
            fromSignIn = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.signupSegue {
            let _ = segue.destination as? SignUpViewController
        }
    }
    
    @IBAction func unwindToWelcome(_ sender: UIStoryboardSegue) {}
}
