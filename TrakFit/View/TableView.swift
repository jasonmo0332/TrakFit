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
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

//        self.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        self.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableFooterView = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

