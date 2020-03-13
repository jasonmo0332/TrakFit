//
//  WeightEntry.swift
//  TrakFit
//
//  Created by Jason Mo on 3/9/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import RealmSwift

class WeightEntry : Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var weight: Double = 0.0
    @objc dynamic var dateNumberValue: Double = 0.0
//    init(date: Date, weight: Double, dateNumberValue: Double) {
//        self.date = date
//        self.weight = weight
//        self.dateNumberValue = dateNumberValue
//    }
    
    
    
    
}
