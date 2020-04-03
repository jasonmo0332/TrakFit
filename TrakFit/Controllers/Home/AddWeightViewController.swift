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
    
    let realm = try! Realm()
    
    lazy var weightEntriesRealm: Results<WeightEntry> = {self.realm.objects(WeightEntry.self)}()
    //Delegate variable
    weak var addWeightViewControllerDelegate: AddWeightViewControllerDelegate?


    
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
    
    @objc func saveButtonDidPressed(_ sender: Any) {
        if let weightText = addWeightView.weightTextfield.text {
            if let input = Double(weightText) {
                let inputDouble = input
            
                let dateDouble = convertDateToTimeIntervalDouble(date: addWeightView.datePicker.date)
                //convert the date value to Double literal
                let entry = WeightEntry()
                entry.date = addWeightView.datePicker.date
                entry.weight = inputDouble
                entry.dateNumberValue = dateDouble
                
                
                
                //Writes to realm
                try! realm.write() {
                    realm.add(entry)
                }
                //sets weightEntriesRealm to be what is avilable in realm
                weightEntriesRealm = realm.objects(WeightEntry.self)
                
            }
            //delegate call to update the graph after submit
            addWeightViewControllerDelegate?.updateOnSave()
            presentingViewController?.dismiss(animated: true, completion: nil)
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
