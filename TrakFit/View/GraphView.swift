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
    var updateButton = CustomButton()
    var graphViewChart = LineChartView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addWeightButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        graphViewChart.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addWeightButton)
        addSubview(updateButton)
        addSubview(graphViewChart)
        
        
        updateButton.setTitle("Update", for: .normal)
        
        addWeightButton.setTitle("Add Weight", for: .normal)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addWeightButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
            addWeightButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
            addWeightButton.widthAnchor.constraint(equalToConstant: 120),
            addWeightButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            updateButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            updateButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
            updateButton.widthAnchor.constraint(equalToConstant: 120),
            updateButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            graphViewChart.centerXAnchor.constraint(equalTo: centerXAnchor),
            graphViewChart.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            graphViewChart.widthAnchor.constraint(equalToConstant: 380),
            graphViewChart.heightAnchor.constraint(equalToConstant: 500)
            
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
