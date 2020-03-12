//
//  ProfileView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class ProfileView : UIView {
    
    var profileNameLabel = CustomLabel()
    var profileNameValue = CustomLabel()
    var logoutButton = CustomButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameValue.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileNameLabel)
        addSubview(profileNameValue)
        addSubview(logoutButton)
        logoutButton.setTitle("Logout", for: .normal)
        profileNameLabel.text = "Name"
        profileNameValue.text = "Jason"
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileNameValue.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            profileNameValue.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            profileNameValue.widthAnchor.constraint(equalToConstant: 120),
            profileNameValue.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            profileNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            profileNameLabel.widthAnchor.constraint(equalToConstant: 120),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            logoutButton.widthAnchor.constraint(equalToConstant: 150),
            logoutButton.heightAnchor.constraint(equalToConstant: 150)
            
        
        ])
    }
    
}
