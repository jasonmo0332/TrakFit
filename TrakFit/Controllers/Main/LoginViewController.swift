//
//  LoginViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 2/5/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //usernameField.delegate = self
        // Do any additional setup after loading the view.
        loginView.signInButton.addTarget(self, action: #selector(signInButtonDidPressed(_:)), for: .touchUpInside)
        loginView.createAccountButton.addTarget(self, action: #selector(createAccountButtonDidPressed(_:)), for: .touchUpInside)
    }
    
    @objc func signInButtonDidPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginView.usernameField.text ?? "", password: loginView.passwordField.text!) { [weak self] authResult, error in
            
        guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.createAlert(title: "Invalid Login", message: error.localizedDescription)
                return
            }
            
            SceneDelegate.shared.rootViewController.switchToMainScreen()
        }
    }
    
    @objc func createAccountButtonDidPressed(_ sender: Any) {
        let createAccountViewController = CreateAccountViewController()
        print("we here")
        navigationController?.pushViewController(createAccountViewController, animated: true)
        
    }
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "LoginSegue" {
            let controller = segue.destination as! UITabBarController
        }
    }*/

}

//extension LoginViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == usernameField {
//
//        }
//    }
//}
