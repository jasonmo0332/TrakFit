//
//  ProfileView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class ProfileView : UIView {
    
    var tableView = TableView()
    var safeArea: UILayoutGuide!
    var logoImageView = UIImageView()
    let logoImage = UIImage(named: "TrakFitProfile") as UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        safeArea = self.layoutMarginsGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = logoImage
        
        addSubview(logoImageView)
        addSubview(tableView)
        
        
        setupConstraints()
        tableView.tableHeaderView = logoImageView
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
//        logoImageView.topAnchor.constraint(equalTo: self.safeArea.topAnchor).isActive = true
//        logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        logoImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}
