//
//  CustomLabel.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CustomLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .black
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
