//
//  ForgotPasswordView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/18/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordView: UIView {
    var emailTextField = CustomTextField()
    var requestPasswordResetButton = CustomButton()
    var forgottenPasswordLabel = CustomLabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        requestPasswordResetButton.translatesAutoresizingMaskIntoConstraints = false
        forgottenPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        emailTextField.type = .email
        requestPasswordResetButton.setTitle("Reset Password", for: .normal)
        forgottenPasswordLabel.text = "Input your email to reset your password"
        
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            forgottenPasswordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            forgottenPasswordLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -200),
            forgottenPasswordLabel.widthAnchor.constraint(equalToConstant: 250),
            forgottenPasswordLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            requestPasswordResetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            requestPasswordResetButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            requestPasswordResetButton.widthAnchor.constraint(equalToConstant: 120),
            requestPasswordResetButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
