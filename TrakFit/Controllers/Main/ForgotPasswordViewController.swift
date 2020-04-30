//
//  ForgotPasswordViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 3/18/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    let forgotPasswordView = ForgotPasswordView()
    override func loadView() {
        view = forgotPasswordView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Password Recovery"
        forgotPasswordView.requestPasswordResetButton.addTarget(self, action: #selector(resetPasswordButtonDidPressed(_:)), for: .touchUpInside)
    }
    
    @objc func resetPasswordButtonDidPressed(_ sender: Any) {
        guard let email = forgotPasswordView.emailTextField.text else {
          return
        }
        // [START password_reset]
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            // [START_EXCLUDE]
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
        
            
        }
    }
}
