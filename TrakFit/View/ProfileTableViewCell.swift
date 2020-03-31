//
//  ProfileTableViewCell.swift
//  TrakFit
//
//  Created by Jason Mo on 3/15/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    var title = CustomLabel()
    var subtitle = CustomLabel()
    var vStack = UIStackView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(vStack)
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(subtitle)
        title.textAlignment = .left
        subtitle.textAlignment = .left
        title.type = .title
        subtitle.type = .subtitle
        vStack.axis = .vertical
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
