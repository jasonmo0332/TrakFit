//
//  CreateAccountView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/12/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CreateAccountView : UIView {
    var emailField = CustomTextField()
    var passwordField = CustomTextField()
    var confirmPasswordField = CustomTextField()
    var signupButton = CustomButton()
    let signupButtonImage = UIImage(named: "SignUpButton") as UIImage?
    
    var passwordErrorLabel = CustomLabel()
    var usernameErrorLabel = CustomLabel()
    var confirmPasswordErrorLabel = CustomLabel()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       backgroundColor = UIColor(red: 172/255, green: 252/255, blue: 217/255, alpha: 1)
       
       emailField.translatesAutoresizingMaskIntoConstraints = false //So it does not auto resize
       passwordField.translatesAutoresizingMaskIntoConstraints = false
       confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
       signupButton.translatesAutoresizingMaskIntoConstraints = false
       usernameErrorLabel.translatesAutoresizingMaskIntoConstraints = false
       passwordErrorLabel.translatesAutoresizingMaskIntoConstraints = false
       confirmPasswordErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        
       addSubview(emailField) // must initialize all components onto the view
       emailField.type = .email
        emailField.accessibilityIdentifier = "email"
       addSubview(passwordField)
       passwordField.type = .password
        passwordField.accessibilityIdentifier = "password"
       addSubview(confirmPasswordField)
       confirmPasswordField.type = .confirmPassword
        confirmPasswordField.accessibilityIdentifier = "confirmPassword"
       addSubview(signupButton)
       signupButton.setImage(signupButtonImage, for: .normal)
       
       addSubview(usernameErrorLabel)
        usernameErrorLabel.text = ""
       addSubview(passwordErrorLabel)
        passwordErrorLabel.text = ""
       addSubview(confirmPasswordErrorLabel)
        confirmPasswordErrorLabel.text = ""
        
       setupConstraints()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func setupConstraints() {
    
    
       NSLayoutConstraint.activate([
           emailField.centerXAnchor.constraint(equalTo: centerXAnchor),
           emailField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
           emailField.widthAnchor.constraint(equalToConstant: 200),
           emailField.heightAnchor.constraint(equalToConstant: 30)
       ])
    
       NSLayoutConstraint.activate([
           usernameErrorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
           usernameErrorLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -75),
           usernameErrorLabel.widthAnchor.constraint(equalToConstant: 200),
           usernameErrorLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
       NSLayoutConstraint.activate([
           passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
           passwordField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
           passwordField.widthAnchor.constraint(equalToConstant: 200),
           passwordField.heightAnchor.constraint(equalToConstant: 30)
       ])
        NSLayoutConstraint.activate([
            passwordErrorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordErrorLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            passwordErrorLabel.widthAnchor.constraint(equalToConstant: 200),
            passwordErrorLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    
       
       NSLayoutConstraint.activate([
           confirmPasswordField.centerXAnchor.constraint(equalTo: centerXAnchor),
           confirmPasswordField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100),
           confirmPasswordField.widthAnchor.constraint(equalToConstant: 200),
           confirmPasswordField.heightAnchor.constraint(equalToConstant: 30)
       ])
    
       NSLayoutConstraint.activate([
           confirmPasswordErrorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
           confirmPasswordErrorLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 125),
           confirmPasswordErrorLabel.widthAnchor.constraint(equalToConstant: 200),
           confirmPasswordErrorLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    
       NSLayoutConstraint.activate([
           signupButton.centerXAnchor.constraint(equalTo: centerXAnchor),
           signupButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
           signupButton.widthAnchor.constraint(equalToConstant: 120),
           signupButton.heightAnchor.constraint(equalToConstant: 40)
       ])
       
   }
}
