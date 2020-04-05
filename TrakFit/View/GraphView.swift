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
    let addWeightButtonImage = UIImage(named: "AddWeightButton") as UIImage?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 172/255, green: 252/255, blue: 217/255, alpha: 1)
        addWeightButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        graphViewChart.translatesAutoresizingMaskIntoConstraints = false
        
        addWeightButton.setImage(addWeightButtonImage, for: .normal)
        addSubview(addWeightButton)
        addSubview(updateButton)
        addSubview(graphViewChart)
        
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addWeightButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addWeightButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 270),
            addWeightButton.widthAnchor.constraint(equalToConstant: 90),
            addWeightButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        
        NSLayoutConstraint.activate([
            graphViewChart.centerXAnchor.constraint(equalTo: centerXAnchor),
            graphViewChart.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70),
            graphViewChart.widthAnchor.constraint(equalToConstant: 380),
            graphViewChart.heightAnchor.constraint(equalToConstant: 600)
            
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
