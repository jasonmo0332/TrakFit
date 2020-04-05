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
    let goalViewController = GoalViewController()
    let settingViewController = SettingViewController()
    var profileCells: [ProfileSettings] {
        return profileView.tableView.profileSettings
    }
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
//        profileView.logoutButton.addTarget(self, action: #selector(logoutButtonDidPressed(_:)), for: .touchUpInside)
        profileView.tableView.dataSource = self
        profileView.tableView.rowHeight = 81
        profileView.tableView.delegate = self
        profileView.tableView.isScrollEnabled = false
//        profileView.tableView.backgroundColor = UIColor(red:172.0, green:252.0, blue:217.0, alpha: 1)
    }
    
    @objc func logoutButtonDidPressed(_ sender: Any) {
        
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


extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileCells.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        cell.title.text = profileCells[indexPath.row].title
        cell.subtitle.text = profileCells[indexPath.row].subtitle
        cell.selectionStyle = .none
        
        return cell
    }
    
    
        
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = profileCells[indexPath.row]
        
        if cell.cellIdentifier == "logo" {
            
        }
        
        if cell.cellIdentifier == "logout" {
            print("Pressed here")
            do {
                  try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
                SceneDelegate.shared.rootViewController.switchToLogout()
        }
        if cell.cellIdentifier == "settings" {
            
             settingViewController.modalPresentationStyle = .fullScreen
             settingViewController.transitioningDelegate = self
             present(settingViewController, animated: true, completion: nil)
             
        }
        
        if cell.cellIdentifier == "goal" {
            //modal push
            goalViewController.modalPresentationStyle = .fullScreen
            goalViewController.transitioningDelegate = self
            present(goalViewController, animated: true, completion: nil)
        }
    }
    
}

extension ProfileViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}
