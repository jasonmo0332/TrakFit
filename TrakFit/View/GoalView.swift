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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
        
        
        trackGoalsLabel.text = "Set the goal weight you want to reach"
        goalTextLabel.text = "Enter goal weight:"
        goalTextField.keyboardType = UIKeyboardType.decimalPad
        goalTextField.placeholder = "150"
        
        
        goalIntervalLabel.text = "Loss interval:"
        goalIntervalTextField.placeholder = "e.g. .5, 1, etc."
        goalIntervalTextField.keyboardType = UIKeyboardType.decimalPad
        
        
        goalStartingWeightLabel.text = "Starting weight:"
        goalStartingWeightTextField.placeholder = "130"
        goalStartingWeightTextField.keyboardType = UIKeyboardType.decimalPad
        
        submitGoalButton.setTitle("Submit", for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        
        
        addSubview(submitGoalButton)
        addSubview(cancelButton)
        addSubview(trackGoalsLabel)
        addSubview(goalTextField)
        addSubview(goalTextLabel)
        addSubview(goalIntervalTextField)
        addSubview(goalIntervalLabel)
        addSubview(goalDatePicker)
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
           trackGoalsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -300),
           trackGoalsLabel.widthAnchor.constraint(equalToConstant: 250),
           trackGoalsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
               
        NSLayoutConstraint.activate([
           goalDatePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
           goalDatePicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
           goalDatePicker.widthAnchor.constraint(equalToConstant: 250),
           goalDatePicker.heightAnchor.constraint(equalToConstant: 250)
        ])
       NSLayoutConstraint.activate([
           goalTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
           goalTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
           goalTextLabel.widthAnchor.constraint(equalToConstant: 150),
           goalTextLabel.heightAnchor.constraint(equalToConstant: 30)
       ])
       NSLayoutConstraint.activate([
            goalTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
           goalTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
           goalTextField.widthAnchor.constraint(equalToConstant: 150),
           goalTextField.heightAnchor.constraint(equalToConstant: 30)
       ])
       
       NSLayoutConstraint.activate([
           goalIntervalLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
           goalIntervalLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
           goalIntervalLabel.widthAnchor.constraint(equalToConstant: 150),
           goalIntervalLabel.heightAnchor.constraint(equalToConstant: 30)
       ])
       
       NSLayoutConstraint.activate([
        goalIntervalTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
           goalIntervalTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
           goalIntervalTextField.widthAnchor.constraint(equalToConstant: 150),
           goalIntervalTextField.heightAnchor.constraint(equalToConstant: 30)
       ])
        NSLayoutConstraint.activate([
            goalStartingWeightLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
            goalStartingWeightLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100),
            goalStartingWeightLabel.widthAnchor.constraint(equalToConstant: 150),
            goalStartingWeightLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
         goalStartingWeightTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
            goalStartingWeightTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100),
            goalStartingWeightTextField.widthAnchor.constraint(equalToConstant: 150),
            goalStartingWeightTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
       
        NSLayoutConstraint.activate([
            submitGoalButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
           submitGoalButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
           submitGoalButton.widthAnchor.constraint(equalToConstant: 150),
           submitGoalButton.heightAnchor.constraint(equalToConstant: 30)
       ])
        
       NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
           cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
           cancelButton.widthAnchor.constraint(equalToConstant: 150),
           cancelButton.heightAnchor.constraint(equalToConstant: 30)
       ])
    }
}
