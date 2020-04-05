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
        //usernameField.delegate = self
        // Do any additional setup after loading the view.
        createAccountView.signupButton.addTarget(self, action: #selector(signupButtonDidPressed(_:)), for: .touchUpInside)
        createAccountView.confirmPasswordField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
        createAccountView.passwordField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
        createAccountView.emailField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
    }
    
    @objc func signupButtonDidPressed(_ sender: UIButton) {

        if (isPasswordValid() && isPasswordMatched()) {
            shouldCreateUser()
        }
        
    }
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func isPasswordValid() -> Bool {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension CreateAccountViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField.text?.count ?? 0 >= 6 && textField.accessibilityLabel == "password" {
//            createAccountView.passwordErrorLabel.text = "Password must be at least 6 characters"
//        }
//        else {
//            createAccountView.passwordErrorLabel.text = ""
//        }
    }
    
    
    
}
