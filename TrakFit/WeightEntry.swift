//
//  WeightEntry.swift
//  TrakFit
//
//  Created by Jason Mo on 3/9/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation

class WeightEntry {
    var date: Date
    var weight: Double
    var dateNumberValue: Double
    init(date: Date, weight: Double, dateNumberValue: Double) {
        self.date = date
        self.weight = weight
        self.dateNumberValue = dateNumberValue
    }
    func calculateDate() {
        
    }
    
}
