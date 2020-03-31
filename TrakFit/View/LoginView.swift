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
    var forgotPasswordButton = CustomButton()
    
    let signinButtonImage = UIImage(named: "SignInButton") as UIImage?
    let createAccountButtonImage = UIImage(named: "CreateAccountButton") as UIImage?
    let forgotPasswordButtonImage = UIImage(named: "ForgotPasswordButton") as UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 172, green: 252, blue: 217, alpha: 1)
        //backgroundColor = .red
//        .init(red: 172.0, green: 252.0, blue: 217.0, alpha: 1.0)
        
        
        usernameField.translatesAutoresizingMaskIntoConstraints = false //So it does not auto resize
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        companyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(usernameField) // must initialize all components onto the view
        usernameField.type = .email
        
        addSubview(passwordField)
        passwordField.type = .password
        
        addSubview(signInButton)
        signInButton.setImage(signinButtonImage, for: .normal)
        
        addSubview(createAccountButton)
        createAccountButton.setImage(createAccountButtonImage, for: .normal)
        
        addSubview(companyTitleLabel)
        companyTitleLabel.text = "TrakFit"
        companyTitleLabel.textAlignment = .center
        
        addSubview(forgotPasswordButton)
        forgotPasswordButton.setImage(forgotPasswordButtonImage, for: .normal)
        
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
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createAccountButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 60),
            createAccountButton.widthAnchor.constraint(equalToConstant: 180),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            forgotPasswordButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 180),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}
