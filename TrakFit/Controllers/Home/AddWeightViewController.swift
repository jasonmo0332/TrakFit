//
//  AddWeightViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 2/16/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class AddWeightViewController: UIViewController {

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
        print(datePickerField.date)
        
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
