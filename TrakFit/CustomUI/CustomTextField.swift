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
        case username
        case password
    }
    
    var type: TextFieldType? {
        didSet {
            switch type {
            case .username:
                placeholder = "username"
            default:
                placeholder = "password"
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
