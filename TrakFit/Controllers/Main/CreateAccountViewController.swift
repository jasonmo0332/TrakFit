//
//  CreateAccountViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 2/5/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    let createAccountView = CreateAccountView()
    
    override func loadView() {
        view = CreateAccountView()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createAccountView.signupButton.addTarget(self, action: #selector(signupButtonDidPressed(_:)), for: .touchUpInside)
        self.title = "Account Creation"
//        createAccountView.confirmPasswordField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
//        createAccountView.passwordField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
//        createAccountView.emailField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
//
//
//        createAccountView.confirmPasswordField.delegate = self
//        createAccountView.passwordField.delegate = self
//        createAccountView.emailField.delegate = self
        
    }
    
//    @objc func signupButtonDidPressed(_ sender: Any) {
//        print("before if")
//        if (isPasswordValid() && isPasswordMatched()) {
//            shouldCreateUser()
//        }
//        print("after if")
//
//    }
    @objc func signupButtonDidPressed(_ sender: Any) {
        print("Clicked here")
    }
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func isPasswordValid() -> Bool {
        print("in is password Valid")
        guard let passwordFieldText = createAccountView.passwordField.text, let confirmPasswordFieldText = createAccountView.confirmPasswordField.text, passwordFieldText.count > 6 else {
            createAccountView.passwordErrorLabel.text = "Passwords must be at least 6 characters"
            createAccountView.usernameErrorLabel.text = ""
            createAccountView.confirmPasswordErrorLabel.text = ""
            return false
        }

        return true
        
    }
    
    func isPasswordMatched() -> Bool {
        guard let passwordFieldText = createAccountView.passwordField.text, let confirmPasswordFieldText = createAccountView.confirmPasswordField.text, passwordFieldText == confirmPasswordFieldText else {
            createAccountView.confirmPasswordErrorLabel.text = "Passwords must match"
            createAccountView.usernameErrorLabel.text = ""
            createAccountView.passwordErrorLabel.text = ""
            return false
        }
        
        
        return true
    }
    
    func shouldCreateUser() {
        guard let emailFieldText = createAccountView.emailField.text, let passwordFieldText = createAccountView.passwordField.text else {
            return
        }
        Auth.auth().createUser(withEmail: emailFieldText, password: passwordFieldText) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                self.createAccountView.usernameErrorLabel.text = error?.localizedDescription
                self.createAccountView.passwordErrorLabel.text = ""
                self.createAccountView.confirmPasswordErrorLabel.text = ""
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }

}

