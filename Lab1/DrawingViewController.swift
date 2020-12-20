//
//  DrawingViewController.swift
//  Lab1
//
//  Created by Lena Soroka on 19.12.2020.
//  Copyright © 2020 Anna Berezhniak. All rights reserved.
//

import UIKit
import Charts

class DrawingViewController: UIViewController, ChartViewDelegate {

    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func chooseType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // if a line is chosen
            lineChartView.isHidden = false
            pieChartView.isHidden = true
            break
        case 1:
            // if a pie is chosen
            pieChartView.isHidden = false
            lineChartView.isHidden = true
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLineChart()
        createPieChart()
        pieChartView.isHidden = true // so default is a line plot
    }
    
    func createLineChart(){
        var entries = [ChartDataEntry]()
        // y = x^3 in the range of x[-3, 3]
        let xArray:[Double] = stride(from: -3, to: 3, by: 0.1).map{$0}
        for x in xArray {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x*x*x)))
        }
        let set = LineChartDataSet(entries: entries, label: "y = x^3")
        set.colors = [UIColor.blue]
        set.drawCirclesEnabled = false
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        lineChartView.data = data
    }
    
    func createPieChart() {
        var entries = [ChartDataEntry]()
        // 30% - orange, 30% - green, 40% - black
        let xArray = [30, 30, 40]
        for x in xArray {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        let set = PieChartDataSet(entries: entries)
        set.colors = [UIColor.orange, UIColor.green, UIColor.black]
        let data = PieChartData(dataSet: set)
        pieChartView.data = data
    }
    

}
