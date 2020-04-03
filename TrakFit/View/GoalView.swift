//
//  GoalView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/18/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit

class GoalView : UIView {
    
    var submitGoalButton = CustomButton()
    var cancelButton = CustomButton()
    var trackGoalsLabel = CustomLabel()
    var goalTextField = CustomTextField()
    var goalTextLabel = CustomLabel() //Enter your goal Weight!
    var goalIntervalTextField = CustomTextField()
    var goalIntervalLabel = CustomLabel()
    var goalStartingWeightTextField = CustomTextField()
    var goalStartingWeightLabel = CustomLabel()
    var goalDatePicker = UIDatePicker()
    var startingGoalDatePicker = UIDatePicker()
    let saveGoalButtonImage = UIImage(named: "SaveButton") as UIImage?
    let cancelButtonImage = UIImage(named: "CancelButton") as UIImage?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 172/255, green: 252/255, blue: 217/255, alpha: 1)
        submitGoalButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        trackGoalsLabel.translatesAutoresizingMaskIntoConstraints = false
        goalTextField.translatesAutoresizingMaskIntoConstraints = false
        goalTextLabel.translatesAutoresizingMaskIntoConstraints = false
        goalIntervalTextField.translatesAutoresizingMaskIntoConstraints = false
        goalIntervalLabel.translatesAutoresizingMaskIntoConstraints = false
        goalDatePicker.translatesAutoresizingMaskIntoConstraints = false
        goalStartingWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        goalStartingWeightTextField.translatesAutoresizingMaskIntoConstraints = false
        startingGoalDatePicker.translatesAutoresizingMaskIntoConstraints = false
        
        
        startingGoalDatePicker.datePickerMode = .date
        
        
        goalDatePicker.datePickerMode = .date
        goalDatePicker.minimumDate = Date() // must be at least today or more
        
        
        trackGoalsLabel.text = "Set your goals"
        trackGoalsLabel.textAlignment = .center
        
        goalTextLabel.text = "Enter goal weight:"
        goalTextLabel.textAlignment = .center
        goalTextField.keyboardType = UIKeyboardType.decimalPad
        goalTextField.placeholder = "150"
        
        
        goalIntervalLabel.text = "Loss interval:"
        goalIntervalLabel.textAlignment = .center
        goalIntervalTextField.placeholder = "e.g. .5, 1, etc."
        goalIntervalTextField.keyboardType = UIKeyboardType.decimalPad
        
        
        goalStartingWeightLabel.text = "Starting weight:"
        goalStartingWeightLabel.textAlignment = .center
        goalStartingWeightTextField.placeholder = "130"
        goalStartingWeightTextField.keyboardType = UIKeyboardType.decimalPad
        
        submitGoalButton.setImage(saveGoalButtonImage, for: .normal)
        cancelButton.setImage(cancelButtonImage, for: .normal)
        
        
        addSubview(submitGoalButton)
        addSubview(cancelButton)
        addSubview(trackGoalsLabel)
        addSubview(goalTextField)
        addSubview(goalTextLabel)
        addSubview(goalIntervalTextField)
        addSubview(goalIntervalLabel)
        addSubview(goalDatePicker)
        addSubview(startingGoalDatePicker)
        addSubview(goalStartingWeightTextField)
        addSubview(goalStartingWeightLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
           trackGoalsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
           trackGoalsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -350),
           trackGoalsLabel.widthAnchor.constraint(equalToConstant: 250),
           trackGoalsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            startingGoalDatePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            startingGoalDatePicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -230),
            startingGoalDatePicker.widthAnchor.constraint(equalToConstant: 250),
            startingGoalDatePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            goalStartingWeightLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
            goalStartingWeightLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -120),
            goalStartingWeightLabel.widthAnchor.constraint(equalToConstant: 150),
            goalStartingWeightLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            goalStartingWeightTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
            goalStartingWeightTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -120),
            goalStartingWeightTextField.widthAnchor.constraint(equalToConstant: 150),
            goalStartingWeightTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
           goalDatePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
           goalDatePicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
           goalDatePicker.widthAnchor.constraint(equalToConstant: 250),
           goalDatePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
       NSLayoutConstraint.activate([
           goalTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
           goalTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 170),
           goalTextLabel.widthAnchor.constraint(equalToConstant: 150),
           goalTextLabel.heightAnchor.constraint(equalToConstant: 30)
       ])
       NSLayoutConstraint.activate([
           goalTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
           goalTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 170),
           goalTextField.widthAnchor.constraint(equalToConstant: 150),
           goalTextField.heightAnchor.constraint(equalToConstant: 30)
       ])
       
       NSLayoutConstraint.activate([
           goalIntervalLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
           goalIntervalLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
           goalIntervalLabel.widthAnchor.constraint(equalToConstant: 150),
           goalIntervalLabel.heightAnchor.constraint(equalToConstant: 30)
       ])
       
       NSLayoutConstraint.activate([
           goalIntervalTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
           goalIntervalTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
           goalIntervalTextField.widthAnchor.constraint(equalToConstant: 150),
           goalIntervalTextField.heightAnchor.constraint(equalToConstant: 30)
       ])
        
        
       
        NSLayoutConstraint.activate([
           submitGoalButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
           submitGoalButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300),
           submitGoalButton.widthAnchor.constraint(equalToConstant: 100),
           submitGoalButton.heightAnchor.constraint(equalToConstant: 40)
       ])
        
       NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
           cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300),
           cancelButton.widthAnchor.constraint(equalToConstant: 100),
           cancelButton.heightAnchor.constraint(equalToConstant: 40)
       ])
    }
}
