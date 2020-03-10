//
//  AddWeightViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 2/16/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Firebase

class AddWeightViewController: UIViewController {

    let ref = Database.database().reference()
    let user = Auth.auth().currentUser
    var weights : [Double] = []
    var dates : [Double] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var datePickerField: UIDatePicker!
    
    @IBAction func datePickerDidChanged(_ sender: Any) {
        print(datePickerField.date)
    }
    @IBAction func saveButton(_ sender: Any) {
        
        let input = Double(weightField.text!)!
        var userProp = UserProperties(userId: user?.uid ?? "", userEmail: user?.email! ?? "", username: user?.email! ?? "")
        var entry = WeightEntry(date: datePickerField.date, weight: input)
        //convert the date value to Double literal
        let dateInteger = convertDateToDouble(date: datePickerField.date)
        
        weights.append(input)
        dates.append(dateInteger)
        self.ref.child("users").child(userProp.userId).setValue(["date": dates, "weight" : weights])
        
        //need to read the NSArray for previous values then Append new values
        
        
    }
    
    func convertDateToDouble(date: Date) -> Double {
        //convert to double (loses milli)
        let dateTimeInterval = date.timeIntervalSince1970
        //convert to int
        let dateInteger = Double(dateTimeInterval)
        return dateInteger
    }
    
    func saveCoreData() {
        
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
