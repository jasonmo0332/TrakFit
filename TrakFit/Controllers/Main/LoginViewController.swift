//
//  LoginViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 2/5/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Firebase

protocol LoginViewControllerDelegate: AnyObject {
    func hideOnboarding()
}

class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameField.text ?? "", password: passwordField.text!) { [weak self] authResult, error in
            
        guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.createAlert(title: "Invalid Login", message: error.localizedDescription)
                return
            }
//            self?.performSegue(withIdentifier: "LoginSegue", sender: self)
            
//            strongSelf.delegate?.hideOnboarding()
            AppDelegate.shared.rootViewController.switchToMainScreen()
        }
        
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! UITabBarController
        let navigationController = UINavigationController(rootViewController: newViewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        print("\(newViewController) hello")
        appdelegate.window!.rootViewController = navigationController*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //usernameField.delegate = self
        // Do any additional setup after loading the view.
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameField {
            
        }
    }
}
