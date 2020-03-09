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


    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func createAccountButton(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailField.text ?? "", password: passwordField.text ?? "") { authResult, error in }
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
