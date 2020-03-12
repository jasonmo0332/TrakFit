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
    }
    
    @objc func signupButtonDidPressed(_ sender: UIButton) {
//        if passwordField.text != confirmPasswordField.text && passwordField.text != "" passwordField.text {
//            createAlert(title: "Password Error", message: "The passwords must match")
//            return
//        }
        guard let passwordFieldText = createAccountView.passwordField.text,
            passwordFieldText == createAccountView.confirmPasswordField.text,
            passwordFieldText.count > 6 else {
            createAlert(title: "Password Error", message: "The passwords must match")
            return
        }
        guard let emailFieldText = createAccountView.emailField.text else {
            createAlert(title: "Email Error", message: "The passwords must match")
            return
        }
        Auth.auth().createUser(withEmail: emailFieldText, password: passwordFieldText) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                self.createAlert(title: "Username Error", message: "\(error!.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
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
    
}
