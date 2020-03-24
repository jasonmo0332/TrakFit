//
//  GoalViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 3/18/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import RealmSwift

class GoalViewController: UIViewController {
    let goalView = GoalView()
    let goalFirebasePath = "myGoal"
    var goalInterval : Double = 0.0
    var goalDate : Double = 0.0
    var goalWeight : Double = 0.0
    var goalStartingWeight: Double = 0.0
    let realm = try! Realm()
    let ref = Database.database().reference()

    var goalEntriesRealm = try! Realm().objects(GoalWeightEntry.self)
    
    override func loadView() {
        view = goalView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        goalView.submitGoalButton.addTarget(self, action: #selector(submitGoalButtonDidPressed(_:)), for: .touchUpInside)
        goalView.cancelButton.addTarget(self, action: #selector(cancelButtonDidPressed(_:)), for: .touchUpInside)
        readFromRealmDatabase()
    }
    
    @objc func submitGoalButtonDidPressed(_ sender: Any) {
        
        if let goalIntervalValue = goalView.goalIntervalTextField.text, let goalWeightValue = goalView.goalTextField.text, let goalStartingWeightValue = goalView.goalStartingWeightTextField.text {
            if let goalIntervalDouble = Double(goalIntervalValue), let goalWeightDouble = Double(goalWeightValue), let goalStartingWeightDouble = Double(goalStartingWeightValue) {
                let goalEntry = GoalWeightEntry()
                goalEntry.interval = goalIntervalDouble
                goalEntry.goalWeight = goalWeightDouble
                goalEntry.dateNumberValue = convertDateToTimeIntervalDouble(date: goalView.goalDatePicker.date)
                goalEntry.goalDate = goalView.goalDatePicker.date
                goalEntry.startingWeight = goalStartingWeightDouble
                //Writes to realm
                try! realm.write() {
                    realm.add(goalEntry, update: .modified)
                }
                
                syncToFirebase(goalWeightEntry: goalEntry)
                presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    @objc func cancelButtonDidPressed(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func convertDateToTimeIntervalDouble(date: Date) -> Double {
        //convert to double (loses milli)
        let dateTimeInterval = date.timeIntervalSince1970
        //convert to Double
        let dateDouble = Double(dateTimeInterval)
        return dateDouble
    }
    
    func syncToFirebase(goalWeightEntry: GoalWeightEntry) {
        let userId = Auth.auth().currentUser?.uid
        self.ref.child("users").child(userId!).child(goalFirebasePath).setValue(["goalDate": goalWeightEntry.dateNumberValue, "goalWeight" : goalWeightEntry.goalWeight, "goalInterval" : goalWeightEntry.interval, "goalStartingWeight" : goalWeightEntry.startingWeight])
    }
    
    
    func readFromRealmDatabase() {
        if goalEntriesRealm.count >= 1 { //should only have one at a time
            for goalWeight in goalEntriesRealm {
                goalView.goalIntervalTextField.text = String(goalWeight.interval)
                goalView.goalStartingWeightTextField.text = String(goalWeight.startingWeight)
                goalView.goalTextField.text = String(goalWeight.goalWeight)
                goalView.goalDatePicker.date = goalWeight.goalDate
            }
        }
    }
    
}
