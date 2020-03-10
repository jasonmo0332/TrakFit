//
//  UserProperties.swift
//  TrakFit
//
//  Created by Jason Mo on 3/10/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import Firebase
class UserProperties {
    let userId : String
    let userEmail : String
    let username: String
//    var weightEntries: [WeightEntry]
    init(userId: String, userEmail: String, username: String) {
        self.userId = userId
        self.userEmail = userEmail
        self.username = username
//        self.weightEntries = weightEntries
    }
    func showUserDetails() {
        print(self.userId)
        print(self.userEmail)
        print(self.username)
    }
}
