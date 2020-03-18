//
//  ProfileSettingsFactory.swift
//  TrakFit
//
//  Created by Jason Mo on 3/15/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//
import Firebase

class ProfileSettingsFactory {
    static func generateProfileSettings() -> [ProfileSettings] {
        var profileCells : [ProfileSettings] = []
        
        if let userEmail = Auth.auth().currentUser?.email {
            let userInfo = ProfileSettings(title: "User", subtitle: userEmail, cellIdentifier: "user")
            profileCells.append(userInfo)
        }
        let goalInfo = ProfileSettings(title: "Goal", subtitle: "Enter your goal Preferences", cellIdentifier: "goal")
        let settingsInfo = ProfileSettings(title: "Settings", subtitle: "Account, Notifications", cellIdentifier: "settings")
        let logoutInfo = ProfileSettings(title: "Logout", subtitle: "Logout of your current session", cellIdentifier: "logout")
        
        profileCells.append(goalInfo)
        profileCells.append(settingsInfo)
        profileCells.append(logoutInfo)
        
        return profileCells
    }
}
