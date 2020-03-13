//
//  LoginView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//


import UIKit

class LoginView : UIView {
    
    var usernameField = CustomTextField()
    var passwordField = CustomTextField()
    var signInButton = CustomButton()
    var createAccountButton = CustomButton()
    var companyTitleLabel = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        usernameField.translatesAutoresizingMaskIntoConstraints = false //So it does not auto resize
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        companyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(usernameField) // must initialize all components onto the view
        usernameField.type = .email
        
        addSubview(passwordField)
        passwordField.type = .password
        
        addSubview(signInButton)
        signInButton.setTitle("Sign In", for: .normal)
        
        addSubview(createAccountButton)
        createAccountButton.setTitle("Create Account", for: .normal)
        
        addSubview(companyTitleLabel)
        companyTitleLabel.text = "TrakFit"
        companyTitleLabel.textAlignment = .center
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            companyTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            companyTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -200),
            companyTitleLabel.widthAnchor.constraint(equalToConstant: 250),
            companyTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            usernameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            usernameField.widthAnchor.constraint(equalToConstant: 200),
            usernameField.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40),
            passwordField.widthAnchor.constraint(equalToConstant: 200),
            passwordField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            signInButton.widthAnchor.constraint(equalToConstant: 120),
            signInButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createAccountButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 60),
            createAccountButton.widthAnchor.constraint(equalToConstant: 200),
            createAccountButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}
