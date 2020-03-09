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

    
    @IBOutlet weak var weightValue: UITextField!
    @IBOutlet weak var mainChart: LineChartView!
    @IBOutlet weak var goalValue: UITextField!
    var inputWeight : [Double] = []
    var inputGoals : [Double] = []
    let ref = Database.database().reference(withPath: "weight")
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func submitButton(_ sender: Any) {
        let input = Double(weightValue.text!)
        inputWeight.append(input!)
        updateGraph()
        let weightItem = self.ref.child("weight")
        weightItem.setValue(input)
    }
    
    @IBAction func goalSubmitButton(_ sender: Any) {
        let input = Double(goalValue.text!)
        inputWeight.append(input!)
        updateGraph()
    }
    func setDate() {
        
    }
    
    func updateGraph() {
        var lineChartEntryWeight = [ChartDataEntry]()
        var lineChartEntryGoal = [ChartDataEntry]()
        
        //user input
        for i in 0..<inputWeight.count {
            let value = ChartDataEntry(x: Double(i), y: inputWeight[i])
            lineChartEntryWeight.append(value)
        }
        //goal weights
        for i in 0..<inputGoals.count {
            let value = ChartDataEntry(x: Double(i), y: inputGoals[i])
            lineChartEntryGoal.append(value)
        }
        
        let weightLine = LineChartDataSet(entries: lineChartEntryWeight, label: "Weight")
        let goalLine = LineChartDataSet(entries: lineChartEntryGoal, label: "Goal Weight")
        weightLine.colors = [NSUIColor.blue]
        goalLine.colors = [NSUIColor.green]
        
        let data = LineChartData(dataSets: [weightLine, goalLine])
        
        
        mainChart.data = data
        mainChart.chartDescription?.text = "My Weight"
        var legend : Legend = mainChart.legend
        legend.textColor = NSUIColor.blue
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
