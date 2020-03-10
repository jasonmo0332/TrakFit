//
//  GraphViewController.swift
//  TrakFit
//
//  Created by Jason Mo on 3/3/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import Charts
import Firebase

class GraphViewController: UIViewController {

    
    @IBOutlet weak var mainChart: LineChartView!
    var inputWeight : [Double] = []
    let user = Auth.auth().currentUser
    let ref = Database.database().reference()
    
    
//    // convert Int to Double
//    let timeInterval = Double(myInt)
//
//    // create NSDate from Double (NSTimeInterval)
//    let myNSDate = Date(timeIntervalSince1970: timeInterval)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromDatabase()
        // Do any additional setup after loading the view.
    }
    
    func convertDoubleToDate(doubleDate: Double) -> Date{
        // convert Int to Double
        let timeInterval = Double(doubleDate)

        // create NSDate from Double (NSTimeInterval)
        let myNSDate = Date(timeIntervalSince1970: timeInterval)
        
        return myNSDate
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        
    }
    
    func readFromDatabase() {
        print(user!.uid)
        ref.child("users").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            self.inputWeight = value!["weight"] as! [Double]
            self.updateGraph()
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func updateGraph() {
        var lineChartEntryWeight = [ChartDataEntry]()

        
        //user input
        for i in 0..<inputWeight.count {
            print(i)
            let value = ChartDataEntry(x: Double(i), y: inputWeight[i])
            lineChartEntryWeight.append(value)
        }
        
        let weightLine = LineChartDataSet(entries: lineChartEntryWeight, label: "Weight")
        weightLine.colors = [NSUIColor.blue]
        
        let data = LineChartData(dataSets: [weightLine])
        
        
        mainChart.data = data
        mainChart.chartDescription?.text = "My Weight"
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
