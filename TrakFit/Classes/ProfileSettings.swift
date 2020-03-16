//
//  ProfileInformation.swift
//  TrakFit
//
//  Created by Jason Mo on 3/15/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit
import Firebase
struct ProfileSettings {
    let title : String
    let subtitle: String
    let cellIdentifier: String
    let userEmail = Auth.auth().currentUser?.email
    init(title: String, subtitle: String, cellIdentifier: String ) {
        self.title = title
        self.subtitle = subtitle
        self.cellIdentifier = cellIdentifier
    }
}

