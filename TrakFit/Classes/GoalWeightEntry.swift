//
//  GoalWeightEntry.swift
//  TrakFit
//
//  Created by Jason Mo on 3/19/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import RealmSwift

class GoalWeightEntry : Object {
    @objc dynamic var interval: Double = 0.0
    @objc dynamic var goalDate: Date = Date()
    @objc dynamic var startingWeight: Double = 0.0
    @objc dynamic var goalWeight: Double = 0.0
    @objc dynamic var dateNumberValue: Double = 0.0
    @objc dynamic var id = 0
    
    
    override static func primaryKey() -> String? {
        return "id"
        
    }
}
