//
//  CustomTextField.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CustomTextField : UITextField {
    
    enum TextFieldType {
        case email
        case password
        case confirmPassword
        case weight
    }
    
    var type: TextFieldType? {
        didSet {
            switch type {
            case .email:
                placeholder = "Email"
                autocapitalizationType = .none
            case .password:
                placeholder = "Password"
                autocapitalizationType = .none
            case .weight:
                placeholder = "Enter Weight"
            case .confirmPassword:
                placeholder = "Confirm Password"
                autocapitalizationType = .none
            default:
                break
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderStyle = .roundedRect
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
