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

class AddWeightViewController: UIViewController {

    let addWeightView = AddWeightView()
    
    let ref = Database.database().reference()
    let userId = Auth.auth().currentUser?.uid
    var weights : [Double] = []
    var dates : [Double] = []
    
    override func loadView() {
        view = addWeightView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addWeightView.saveButton.addTarget(self, action: #selector(saveButtonDidPressed(_:)), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    
    func datePickerDidChanged(_ sender: Any) {
        
    }
    @objc func saveButtonDidPressed(_ sender: Any) {
        if let weightText = addWeightView.weightTextfield.text {
            let input = Double(weightText)
            let dateDouble = convertDateToDouble(date: addWeightView.datePicker.date)
            var entry = WeightEntry(date: addWeightView.datePicker.date, weight: input ?? 0, dateNumberValue: dateDouble)
            //convert the date value to Double literal
            
            
            weights.append(input ?? 0)
            dates.append(dateDouble)
            self.ref.child("users").child(userId!).setValue(["date": dates, "weight" : weights])
        }
        
        
        
        //need to read the NSArray for previous values then Append new values
        
        
    }
    
    @objc func cancelButtonDidPressed(_ sender: Any) {
    
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
