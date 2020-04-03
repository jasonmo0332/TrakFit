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
    var startDate: Double = 0.0
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
        let deletePrevious = realm.objects(GoalWeightGraph.self) // delete previous realm data for next
        
        if let goalIntervalValue = goalView.goalIntervalTextField.text, let goalWeightValue = goalView.goalTextField.text, let goalStartingWeightValue = goalView.goalStartingWeightTextField.text {
            if let goalIntervalDouble = Double(goalIntervalValue), let goalWeightDouble = Double(goalWeightValue), let goalStartingWeightDouble = Double(goalStartingWeightValue) {
                let goalEntry = GoalWeightEntry()
                goalEntry.interval = goalIntervalDouble
                goalEntry.goalWeight = goalWeightDouble
                goalEntry.goalDateNumberValue = convertDateToTimeIntervalDouble(date: goalView.goalDatePicker.date)
                goalEntry.goalDate = goalView.goalDatePicker.date
                goalEntry.startingWeight = goalStartingWeightDouble
                goalEntry.goalStartingDate = goalView.startingGoalDatePicker.date
                goalEntry.goalStartingDateNumberValue = convertDateToTimeIntervalDouble(date: goalView.startingGoalDatePicker.date)
                //Writes to realm
                
                
                
                let goalWeightGraphValue = calculateGoalNodes(myGoals: goalEntry)
                
                try! realm.write() {
                    realm.delete(deletePrevious)
                    realm.add(goalEntry, update: .modified)
                    realm.add(goalWeightGraphValue)
                }
                
                syncToFirebase(goalWeightEntry: goalEntry)
                presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func calculateGoalNodes(myGoals : GoalWeightEntry) -> [GoalWeightGraph]{
        
        
        var goalWeightGraphValues : [GoalWeightGraph] = []
        //if starting weight minus the goal weight is >= 0 then they want to
        //150 starting to get to 160 >= 0, so false
        
        let isWeightLossOrGain = myGoals.startingWeight - myGoals.goalWeight >= 0
        //initial date
        
        let initialGoalWeightAndDate = GoalWeightGraph()
        initialGoalWeightAndDate.goalDate = myGoals.goalStartingDate
        initialGoalWeightAndDate.goalDateNumberValue = myGoals.goalStartingDateNumberValue
        initialGoalWeightAndDate.goalWeight = myGoals.startingWeight
        
        goalWeightGraphValues.append(initialGoalWeightAndDate)
        
        var initialWeight = myGoals.startingWeight
        var initialStartingDate = myGoals.goalStartingDate
        
        while initialStartingDate <= myGoals.goalDate {
            let sequentialGoalWeightAndDate = GoalWeightGraph()
            if let tempGoalDate = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: initialStartingDate) {
                sequentialGoalWeightAndDate.goalDate = tempGoalDate
                sequentialGoalWeightAndDate.goalDateNumberValue = convertDateToTimeIntervalDouble(date: tempGoalDate)
                initialStartingDate = tempGoalDate
            }
            //want weight loss
            if !isWeightLossOrGain {
                sequentialGoalWeightAndDate.goalWeight = initialWeight + myGoals.interval
                goalWeightGraphValues.append(sequentialGoalWeightAndDate)
                initialWeight += myGoals.interval
            }
            //want weight gain
            else {
                sequentialGoalWeightAndDate.goalWeight = initialWeight - myGoals.interval
                goalWeightGraphValues.append(sequentialGoalWeightAndDate)
                initialWeight -= myGoals.interval
            }
        }
        
        return goalWeightGraphValues
        
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
        self.ref.child("users").child(userId!).child(goalFirebasePath).setValue(["goalDate": goalWeightEntry.goalDateNumberValue, "goalWeight" : goalWeightEntry.goalWeight, "goalInterval" : goalWeightEntry.interval, "goalStartingWeight" : goalWeightEntry.startingWeight])
    }
    
    
    func readFromRealmDatabase() {
        if goalEntriesRealm.count >= 1 { //should only have one at a time
            for goalWeight in goalEntriesRealm {
                goalView.goalIntervalTextField.text = String(goalWeight.interval)
                goalView.goalStartingWeightTextField.text = String(goalWeight.startingWeight)
                goalView.goalTextField.text = String(goalWeight.goalWeight)
                goalView.goalDatePicker.date = goalWeight.goalDate
                goalView.startingGoalDatePicker.date = goalWeight.goalStartingDate
            }
        }
    }
    
}
