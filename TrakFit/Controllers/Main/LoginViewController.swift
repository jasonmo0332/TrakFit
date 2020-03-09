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

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameField.text ?? "", password: passwordField.text!) { [weak self] authResult, error in
        guard let strongSelf = self else { return }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
