//
//  AddWeightViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 2/16/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

protocol AddWeightViewControllerDelegate: AnyObject {
    func updateOnSave()
}

class AddWeightViewController: UIViewController {
    //View variable
    let addWeightView = AddWeightView()
    //import variables
    let ref = Database.database().reference()
    let userId = Auth.auth().currentUser?.uid
    let realm = try! Realm()
    lazy var weightEntriesRealm: Results<WeightEntry> = {self.realm.objects(WeightEntry.self)}()
    //Delegate variable
    weak var addWeightViewControllerDelegate: AddWeightViewControllerDelegate?
    
    
    
    
    //Relevant member variable
    var weights : [Double] = []
    var dates : [Double] = []

    
    override func loadView() {
        view = addWeightView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addWeightView.saveButton.addTarget(self, action: #selector(saveButtonDidPressed(_:)), for: .touchUpInside)
        addWeightView.cancelButton.addTarget(self, action: #selector(cancelButtonDidPressed(_:)), for: .touchUpInside)
        //for looking at realm config
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // Do any additional setup after loading the view.
    }
    
    func datePickerDidChanged(_ sender: Any) {
        
    }
    @objc func saveButtonDidPressed(_ sender: Any) {
        if let weightText = addWeightView.weightTextfield.text {
            if let input = Double(weightText) {
                let inputDouble = input
            
                let dateDouble = convertDateToDouble(date: addWeightView.datePicker.date)
    //            var entry = WeightEntry(date: addWeightView.datePicker.date, weight: input ?? 0, dateNumberValue: dateDouble)
                //convert the date value to Double literal
                let entry = WeightEntry()
                entry.date = addWeightView.datePicker.date
                entry.weight = inputDouble
                entry.dateNumberValue = dateDouble
                
                weights.append(inputDouble)
                dates.append(dateDouble)
                try! realm.write() {
                    realm.add(entry)
                }
                weightEntriesRealm = realm.objects(WeightEntry.self)
                self.ref.child("users").child(userId!).setValue(["date": dates, "weight" : weights])
            }
            addWeightViewControllerDelegate?.updateOnSave()
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func cancelButtonDidPressed(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func convertDateToDouble(date: Date) -> Double {
        //convert to double (loses milli)
        let dateTimeInterval = date.timeIntervalSince1970
        //convert to int
        let dateInteger = Double(dateTimeInterval)
        return dateInteger
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
