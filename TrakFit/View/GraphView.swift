//
//  GraphView.swift
//  TrakFit
//
//  Created by Jason Mo on 3/11/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Charts
class GraphView : UIView {
    
    var addWeightButton = CustomButton()
    var changeGoalButton = CustomButton()
    var updateButton = CustomButton()
    var graphViewChart = LineChartView()
    let addWeightButtonImage = UIImage(named: "AddWeightButton") as UIImage?
    let changeGoalButtonImage = UIImage(named: "ChangeGoalButton") as UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 172/255, green: 252/255, blue: 217/255, alpha: 1)
        addWeightButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        graphViewChart.translatesAutoresizingMaskIntoConstraints = false
        changeGoalButton.translatesAutoresizingMaskIntoConstraints = false
        
        addWeightButton.setImage(addWeightButtonImage, for: .normal)
        changeGoalButton.setImage(changeGoalButtonImage, for: .normal)
        addSubview(changeGoalButton)
        addSubview(addWeightButton)
        addSubview(updateButton)
        addSubview(graphViewChart)
        
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            changeGoalButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            changeGoalButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -310),
            changeGoalButton.widthAnchor.constraint(equalToConstant: 60),
            changeGoalButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            addWeightButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addWeightButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 270),
            addWeightButton.widthAnchor.constraint(equalToConstant: 90),
            addWeightButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
        NSLayoutConstraint.activate([
            graphViewChart.centerXAnchor.constraint(equalTo: centerXAnchor),
            graphViewChart.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -35),
            graphViewChart.widthAnchor.constraint(equalToConstant: 380),
            graphViewChart.heightAnchor.constraint(equalToConstant: 500)
            
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
