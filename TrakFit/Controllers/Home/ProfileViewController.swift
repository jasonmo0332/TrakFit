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
        profileView.tableView.rowHeight = 100
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


extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileCells.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 1000
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        cell.title.text = profileCells[indexPath.row].title
        cell.subtitle.text = profileCells[indexPath.row].subtitle
//        cell.backgroundColor = .red
//        cell.textLabel?.text? = profileCells[indexPath.row].title
//        cell.detailTextLabel?.text? = profileCells[indexPath.row].subtitle
        
        return cell
    }
}
