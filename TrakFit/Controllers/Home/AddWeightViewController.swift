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

    let ref = Database.database().reference()
    let userId = Auth.auth().currentUser?.uid
    var weights : [Double] = []
    var dates : [Double] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var weightField = UITextField()
    
    var datePickerField = UIDatePicker()
    
    var saveButton = UIButton()
    
    func datePickerDidChanged(_ sender: Any) {
        print(datePickerField.date)
    }
    func saveButtonDidPressed(_ sender: Any) {
        
        let input = Double(weightField.text!)!
        let dateDouble = convertDateToDouble(date: datePickerField.date)
        var entry = WeightEntry(date: datePickerField.date, weight: input, dateNumberValue: dateDouble)
        //convert the date value to Double literal
        
        
        weights.append(input)
        dates.append(dateDouble)
        self.ref.child("users").child(userId!).setValue(["date": dates, "weight" : weights])
        
        //need to read the NSArray for previous values then Append new values
        
        
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
