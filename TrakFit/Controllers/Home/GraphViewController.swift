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

    
    var inputWeights : [Double] = []
    var updateButton = UIButton()
    let user = Auth.auth().currentUser
    let ref = Database.database().reference()
    let graphView = GraphView()
    
    override func loadView() {
        view = graphView
    }
    
//    // convert Int to Double
//    let timeInterval = Double(myInt)
//
//    // create NSDate from Double (NSTimeInterval)
//    let myNSDate = Date(timeIntervalSince1970: timeInterval)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.updateButton.addTarget(self, action: #selector(updateButtonDidPressed(_:)), for: .touchUpInside)
        graphView.addWeightButton.addTarget(self, action: #selector(addWeightButtonDidPressed(_:)), for: .touchUpInside)
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
    
    @objc func updateButtonDidPressed(_ sender: Any) {
        readFromDatabase()
        
    }
    
    @objc func addWeightButtonDidPressed(_ sender: Any) {
        SceneDelegate.shared.rootViewController.switchToAddWeightScreen()
    }
    
    func readFromDatabase() {
        print(user!.uid)
        ref.child("users").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let valueDic = snapshot.value as? NSDictionary
            if let weightVals = valueDic?["weight"], let weightValsAsDoubles = weightVals as? [Double] {
                self.inputWeights = weightValsAsDoubles
            }
            self.updateGraph()
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func updateGraph() {
        var lineChartEntryWeight = [ChartDataEntry]()

        
        //user input
        for i in 0..<inputWeights.count {
            print(i)
            let value = ChartDataEntry(x: Double(i), y: inputWeights[i])
            lineChartEntryWeight.append(value)
        }
        
        let weightLine = LineChartDataSet(entries: lineChartEntryWeight, label: "Weight")
        weightLine.colors = [NSUIColor.blue]
        
        let data = LineChartData(dataSets: [weightLine])
        
        
        graphView.graphView.data = data
        graphView.graphView.chartDescription?.text = "My Weight"
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
