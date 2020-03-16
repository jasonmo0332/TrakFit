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

class GraphViewController: UIViewController {

    
    var inputWeights : [Double] = []
    var inputDates : [Double] = []
    var updateButton = UIButton()
    
    //delegate
    weak var axisFormatDelegate: IAxisValueFormatter?
    //import variables
    let user = Auth.auth().currentUser
    let ref = Database.database().reference()
    let realm = try! Realm()
//    lazy var weightEntriesRealm: Results<WeightEntry> = {self.realm.objects(WeightEntry.self)}()
    var weightEntriesRealm = try! Realm().objects(WeightEntry.self)
    //View Variable
    let graphView = GraphView()
    let addWeightViewController = AddWeightViewController()
    
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
        axisFormatDelegate = self
        readFromRealmDatabase()
        
        //Delegate
        addWeightViewController.addWeightViewControllerDelegate = self
        syncToFirebase()
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
        readFromRealmDatabase()
        
    }
    
    @objc func addWeightButtonDidPressed(_ sender: Any) {

        //modal push
        addWeightViewController.modalPresentationStyle = .fullScreen
        addWeightViewController.transitioningDelegate = self
        present(addWeightViewController, animated: true, completion: nil)
    }
    
    func readFromFirebaseDatabase() {
        print(user!.uid)
        ref.child("users").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let valueDic = snapshot.value as? NSDictionary
            //grabs weight array
            if let weightVals = valueDic?["weight"], let weightValsAsDoubles = weightVals as? [Double] {
                //weights being display
                self.inputWeights = weightValsAsDoubles
            }
            self.updateGraph()
            
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func readFromRealmDatabase() {
        var grabFromRealmWeightEntries : [Double] = []
        var grabFromRealmDateEntries : [Double] = []
        for weightEntries in weightEntriesRealm {
            grabFromRealmWeightEntries.append(weightEntries.weight)
            grabFromRealmDateEntries.append(weightEntries.dateNumberValue)
        }
        self.inputWeights = grabFromRealmWeightEntries
        self.inputDates = grabFromRealmDateEntries
        self.updateGraph()
        self.syncToFirebase()
    }
    
    func updateGraph() {
        var lineChartEntryWeight = [ChartDataEntry]()
        
        //user input
        for i in 0..<inputDates.count {
            print(inputDates[i])
            let value = ChartDataEntry(x: inputDates[i], y: inputWeights[i])
            lineChartEntryWeight.append(value)
        }
        
        
        let weightLine = LineChartDataSet(entries: lineChartEntryWeight, label: "Weight")
        weightLine.colors = [NSUIColor.blue]
        let data = LineChartData(dataSet: weightLine)
        
        graphView.graphViewChart.data = data
        graphView.graphViewChart.chartDescription?.text = "My Weight"
        
        //Setting up xAxis
        let xAxis = graphView.graphViewChart.xAxis // format
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = axisFormatDelegate
        xAxis.setLabelCount(inputDates.count, force: true)
    }
    
    func syncToFirebase() {
        let userId = Auth.auth().currentUser?.uid
        self.ref.child("users").child(userId!).setValue(["date": inputDates, "weight" : inputWeights])
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

extension GraphViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}

extension GraphViewController: AddWeightViewControllerDelegate {
    func updateOnSave() {
//        addWeightViewController.addWeightViewControllerDelegate = self
        readFromRealmDatabase()
    }
}

extension GraphViewController: IAxisValueFormatter {

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM-dd-yy"
        
        print(dateFormatter.string(from: Date(timeIntervalSince1970: value)))
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}
