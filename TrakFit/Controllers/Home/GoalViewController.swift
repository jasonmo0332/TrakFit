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

protocol GoalViewControllerDelegate: AnyObject {
    func updateOnGoalSave()
}

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
    
    weak var goalViewControllerDelegate: GoalViewControllerDelegate?
    
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

        let deletePrevious = realm.objects(GoalWeightGraph.self)
        if let goalIntervalValue = goalView.goalIntervalTextField.text, let goalWeightValue = goalView.goalTextField.text, let goalStartingWeightValue = goalView.goalStartingWeightTextField.text {
            if let goalIntervalDouble = Double(goalIntervalValue), let goalWeightDouble = Double(goalWeightValue), let goalStartingWeightDouble = Double(goalStartingWeightValue) {
                
                
                
                
                let goalEntry = GoalWeightEntry()
                goalEntry.interval = goalIntervalDouble
                goalEntry.goalWeight = goalWeightDouble
//                goalEntry.goalDateNumberValue = convertDateToTimeIntervalDouble(date: goalView.goalDatePicker.date)
//                goalEntry.goalDate = goalView.goalDatePicker.date
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
                goalViewControllerDelegate?.updateOnGoalSave()
                syncToFirebase(goalWeightEntry: goalEntry)
                presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func calculateGoalNodes(myGoals : GoalWeightEntry) -> [GoalWeightGraph]{
        
        
        var goalWeightGraphValues : [GoalWeightGraph] = []
        //if starting weight minus the goal weight is >= 0 then they want to
        //170 starting to get to 160 >= 0, so false
        
        let isWeightLossOrGain = myGoals.startingWeight - myGoals.goalWeight >= 0
        //initial date
        
        let initialGoalWeightAndDate = GoalWeightGraph()
        initialGoalWeightAndDate.goalDate = myGoals.goalStartingDate
        initialGoalWeightAndDate.goalDateNumberValue = myGoals.goalStartingDateNumberValue
        initialGoalWeightAndDate.goalWeight = myGoals.startingWeight
        
        goalWeightGraphValues.append(initialGoalWeightAndDate)
        
        var initialWeight = myGoals.startingWeight
        var initialStartingDate = myGoals.goalStartingDate
        var initialGoalWeight = myGoals.goalWeight
        
        
        
        //want weight lose
        if isWeightLossOrGain {
            while initialWeight != initialGoalWeight {
                print("Here for loss")
                let sequentialGoalWeightAndDate = GoalWeightGraph()
                if let tempGoalDate = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: initialStartingDate) {
                    sequentialGoalWeightAndDate.goalDate = tempGoalDate
                    sequentialGoalWeightAndDate.goalDateNumberValue = convertDateToTimeIntervalDouble(date: tempGoalDate)
                    initialStartingDate = tempGoalDate
                }
                initialWeight -= myGoals.interval
                sequentialGoalWeightAndDate.goalWeight = initialWeight
                goalWeightGraphValues.append(sequentialGoalWeightAndDate)
            }
        }
        //want weight gain
        else {
            while initialWeight != initialGoalWeight {
                print("Here for gain")
                let sequentialGoalWeightAndDate = GoalWeightGraph()
                if let tempGoalDate = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: initialStartingDate) {
                    sequentialGoalWeightAndDate.goalDate = tempGoalDate
                    sequentialGoalWeightAndDate.goalDateNumberValue = convertDateToTimeIntervalDouble(date: tempGoalDate)
                    initialStartingDate = tempGoalDate
                }
                initialWeight += myGoals.interval
                sequentialGoalWeightAndDate.goalWeight = initialWeight
                goalWeightGraphValues.append(sequentialGoalWeightAndDate)
                
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
        self.ref.child("users").child(userId!).child(goalFirebasePath).setValue(["goalDate": goalWeightEntry.goalDateNumberValue, "goalWeight" : goalWeightEntry.goalWeight, "goalInterval" : goalWeightEntry.interval, "goalStartingWeight" : goalWeightEntry.startingWeight, "goalStartingWeightDate": goalWeightEntry.goalStartingDateNumberValue])
    }
    
    
    func readFromRealmDatabase() {
        if goalEntriesRealm.count >= 1 { //should only have one at a time
            for goalWeight in goalEntriesRealm {
                goalView.goalIntervalTextField.text = String(goalWeight.interval)
                goalView.goalStartingWeightTextField.text = String(goalWeight.startingWeight)
                goalView.goalTextField.text = String(goalWeight.goalWeight)
//                goalView.goalDatePicker.date = goalWeight.goalDate
                goalView.startingGoalDatePicker.date = goalWeight.goalStartingDate
            }
        }
    }
    
//    func isWeightValid(startingWeight: Double, goalWeight: Double, startingDate: Date, goalDate: Date, interval: Double) -> Bool {
//        let dateDelta = goalDate - startingDate
//
//        //if someone put they want to lose 1lbs in one week
//
//
//
//        return true
//    }
    
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
}

