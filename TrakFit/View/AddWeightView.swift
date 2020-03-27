//
//  AddWeightView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
class AddWeightView : UIView {
    var datePicker = UIDatePicker()
    var saveButton = CustomButton()
    var weightTextfield = CustomTextField()
    var weightLabel = CustomLabel()
    var cancelButton = CustomButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        weightTextfield.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePicker)
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date() //only allows user to set todays date as max
        addSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        addSubview(cancelButton)
        cancelButton.setTitle("Cancel", for: .normal)
        addSubview(weightTextfield)
        weightTextfield.keyboardType = UIKeyboardType.decimalPad
        addSubview(weightLabel)
        weightLabel.text = "Enter Weight:"
        
        setupConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -200),
            datePicker.widthAnchor.constraint(equalToConstant: 250),
            datePicker.heightAnchor.constraint(equalToConstant: 250)
        ])
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -60),
            saveButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 80),
            saveButton.widthAnchor.constraint(equalToConstant: 150),
            saveButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            weightTextfield.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            weightTextfield.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            weightTextfield.widthAnchor.constraint(equalToConstant: 120),
            weightTextfield.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            weightLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            weightLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            weightLabel.widthAnchor.constraint(equalToConstant: 120),
            weightLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60),
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 80),
            cancelButton.widthAnchor.constraint(equalToConstant: 150),
            cancelButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
