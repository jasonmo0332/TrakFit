//
//  MainTabBarController.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTabBar()
        
    }
    
    func setupTabBar() {
        let profileController = UINavigationController(rootViewController: ProfileViewController())
        profileController.tabBarItem.image = UIImage(named: "ProfileIcon")
        profileController.tabBarItem.selectedImage = UIImage(named: "ProfileIcon")
        let graphController = UINavigationController(rootViewController: GraphViewController())
        graphController.tabBarItem.image = UIImage(named: "GraphIcon")
        graphController.tabBarItem.selectedImage = UIImage(named: "GraphIcon")
        
        viewControllers = [profileController, graphController]
        
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
