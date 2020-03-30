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
import RealmSwift
import UserNotifications

class GraphViewController: UIViewController {

    let firebasePath : String = "myWeight"
    var inputWeightEntries : [WeightEntry] = []
    var inputGoalWeightEntries: [GoalWeightEntry] = []
    var inputGoalWeightGraphEntries: [GoalWeightGraph] = []
    //delegate
    weak var axisFormatDelegate: IAxisValueFormatter?
    //import variables
    let user = Auth.auth().currentUser
    let ref = Database.database().reference()
    let realm = try! Realm()
    
    //Variables for Realm
    var weightEntriesRealm = try! Realm().objects(WeightEntry.self)
    var goalEntriesRealm = try! Realm().objects(GoalWeightEntry.self)
    var goalWeightGraphEntriesRealm = try! Realm().objects(GoalWeightGraph.self)
    //View Variable
    let graphView = GraphView()
    let addWeightViewController = AddWeightViewController()
    
    override func loadView() {
        view = graphView
    }
    
    func setupNotifications() {
        //asking for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]) { (granted, error) in
            
        }
        
        //message in content
        let content = UNMutableNotificationContent()
        content.title = "Enter your weight!"
        content.body = "Input your weight to track it daily!"
        
        
        //sets the time
        var dateForNotification = DateComponents()
        dateForNotification.calendar = Calendar.current
       
        dateForNotification.hour = 15
    
       
       let trigger = UNCalendarNotificationTrigger(dateMatching: dateForNotification, repeats: true)
        
        //set up with trigger
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        center.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate
        axisFormatDelegate = self
        addWeightViewController.addWeightViewControllerDelegate = self

        // Do any additional setup after loading the view.
        setupNotifications()
        readFromRealmDatabase()
        syncToFirebase()
        //Button actions
        
        graphView.addWeightButton.addTarget(self, action: #selector(addWeightButtonDidPressed(_:)), for: .touchUpInside)
    }
    
    func convertDoubleToDate(doubleDate: Double) -> Date{
        // convert Int to Double
        let timeInterval = Double(doubleDate)

        // create NSDate from Double (NSTimeInterval)
        let myNSDate = Date(timeIntervalSince1970: timeInterval)
        
        return myNSDate
    }
    
    
    @objc func addWeightButtonDidPressed(_ sender: Any) {

        //modal push
        addWeightViewController.modalPresentationStyle = .fullScreen
        addWeightViewController.transitioningDelegate = self
        present(addWeightViewController, animated: true, completion: nil)
    }
    
    func readFromRealmDatabase() {
        //input weight

        //goal
        
        //Add the goal values into realm
        for weightEntries in weightEntriesRealm {

            inputWeightEntries.append(weightEntries)
        }

        //Only singular value
        for goalWeightEntries in goalEntriesRealm {
            inputGoalWeightEntries.append(goalWeightEntries)
        }
        
        for goalWeightGraphEntries in goalWeightGraphEntriesRealm {
            inputGoalWeightGraphEntries.append(goalWeightGraphEntries)
        }
        
        self.updateGraph()
        self.syncToFirebase()
    }
    
    func updateGraph() {
        
        /*
         weightline for user input
         */
        var lineChartEntryWeight = [ChartDataEntry]()
        
        let data = LineChartData()
        inputWeightEntries.sort{$0.date < $1.date} //sort based on date
        
        for i in 0..<inputWeightEntries.count {
            let value = ChartDataEntry(x: inputWeightEntries[i].dateNumberValue, y: inputWeightEntries[i].weight)
            lineChartEntryWeight.append(value)
        }
        
        let weightLine = LineChartDataSet(entries: lineChartEntryWeight, label: "Weight")
        weightLine.colors = [NSUIColor.blue]
        
        
        data.addDataSet(weightLine)
    
         /*
         Draw Goal graph here
         
         */
        var lineChartGoalWeight = [ChartDataEntry]()
        
        inputGoalWeightEntries.sort {$0.goalDate < $1.goalDate}
        
       
        for i in 0..<inputGoalWeightGraphEntries.count {
            //fix
            let value = ChartDataEntry(x: inputGoalWeightGraphEntries[i].goalDateNumberValue, y:inputGoalWeightGraphEntries[i].goalWeight)
            lineChartGoalWeight.append(value)
        }
        let goalLine = LineChartDataSet(entries: lineChartGoalWeight, label: "Goal")
        goalLine.colors = [NSUIColor.green]
        
        data.addDataSet(goalLine)
        //Setting up xAxis
        let xAxis = graphView.graphViewChart.xAxis // format
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = axisFormatDelegate
        xAxis.axisMaxLabels = 5
        xAxis.setLabelCount(5, force: true)
        
        
        graphView.graphViewChart.chartDescription?.text = "My Weight"
        graphView.graphViewChart.animate(xAxisDuration: 1.0)
        graphView.graphViewChart.data = data
    }
    
    func syncToFirebase() { //Synchronize the data from realmbase into firebase
        let userId = Auth.auth().currentUser?.uid
        var inputDates: [Double] = []
        var inputWeights: [Double] = []
        
        for tempDateAndWeight in inputWeightEntries {
            inputDates.append(tempDateAndWeight.dateNumberValue)
            inputWeights.append(tempDateAndWeight.weight)
        }
        
        self.ref.child("users").child(userId!).child(firebasePath).setValue(["date": inputDates, "weight" : inputWeights])
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

//for showing transition
extension GraphViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}


//Delegate used to update the graph on submit from AddWeightViewController
extension GraphViewController: AddWeightViewControllerDelegate {
    func updateOnSave() {
//        addWeightViewController.addWeightViewControllerDelegate = self
        readFromRealmDatabase()
    }
}
//formats the xaxis to be dates
extension GraphViewController: IAxisValueFormatter {

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM-dd-yy"
        
        print(dateFormatter.string(from: Date(timeIntervalSince1970: value)))
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}
