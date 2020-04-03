//
//  TableView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/15/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class TableView: UITableView {
    let profileSettings : [ProfileSettings] = ProfileSettingsFactory.generateProfileSettings()
    let logoImage = UIImage(named: "TrakFitProfile") as UIImage?
    let logoImageview = UIImageView()
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

//        self.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        self.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableFooterView = UIView()
        //set this to transparent so the profile image can show
        backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

