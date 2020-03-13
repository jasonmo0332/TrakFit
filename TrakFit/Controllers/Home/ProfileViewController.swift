//
//  ProfileViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 3/10/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    let firebaseAuth = Auth.auth()
    
    let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileView.logoutButton.addTarget(self, action: #selector(logoutButtonDidPressed(_:)), for: .touchUpInside)
        
    }
    
    @objc func logoutButtonDidPressed(_ sender: Any) {
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        SceneDelegate.shared.rootViewController.switchToLogout()
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
