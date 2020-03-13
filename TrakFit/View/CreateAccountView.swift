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
       
    override init(frame: CGRect) {
       super.init(frame: frame)
       backgroundColor = .white
       
       emailField.translatesAutoresizingMaskIntoConstraints = false //So it does not auto resize
       passwordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
       signupButton.translatesAutoresizingMaskIntoConstraints = false
       
       addSubview(emailField) // must initialize all components onto the view
       emailField.type = .email
       
       addSubview(passwordField)
        passwordField.type = .password
        addSubview(confirmPasswordField)
        confirmPasswordField.type = .confirmPassword
       addSubview(signupButton)
       signupButton.setTitle("Sign Up", for: .normal)
       
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
           passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
           passwordField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40),
           passwordField.widthAnchor.constraint(equalToConstant: 200),
           passwordField.heightAnchor.constraint(equalToConstant: 30)
       ])
       
       NSLayoutConstraint.activate([
           confirmPasswordField.centerXAnchor.constraint(equalTo: centerXAnchor),
           confirmPasswordField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
           confirmPasswordField.widthAnchor.constraint(equalToConstant: 200),
           confirmPasswordField.heightAnchor.constraint(equalToConstant: 30)
       ])
       
       NSLayoutConstraint.activate([
           signupButton.centerXAnchor.constraint(equalTo: centerXAnchor),
           signupButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 60),
           signupButton.widthAnchor.constraint(equalToConstant: 200),
           signupButton.heightAnchor.constraint(equalToConstant: 30)
       ])
       
   }
}
