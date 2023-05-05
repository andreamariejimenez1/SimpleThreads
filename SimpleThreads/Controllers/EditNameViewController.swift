//
//  EditNameViewController.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import UIKit

protocol EditNameViewControllerDelegate {
    func didTapSaveButton(firstName: String, lastName: String, indexPath: IndexPath?)
}

class EditNameViewController: UIViewController {
    
    var delegate: EditNameViewControllerDelegate?
    var indexPath: IndexPath?
    
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
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text, firstName != "" else { return }
        guard let lastName = lastNameTextField.text, lastName != "" else { return }
        delegate?.didTapSaveButton(firstName: firstName, lastName: lastName, indexPath: indexPath)
        
        navigationController?.popViewController(animated: true)
    }
}

extension EditNameViewController: UITextFieldDelegate {
    // when user tap saves we need to get the text in the box and set it equal to the variable
    // then we pass that variable to account
    //
}
