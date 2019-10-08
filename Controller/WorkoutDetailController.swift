//
//  WorkoutDetailController.swift
//  Pushup Tracker
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WorkoutDetailController: UIViewController {
    
//MARK - Properties
    var numPushups = 0
    var date = "10/7/2019"
    var setNum = 0
    
//MARK - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var numSetLabel: UILabel!
    
    @IBOutlet weak var numPushupsLabel: UILabel!
    
//MARK - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI(){
        numPushupsLabel.text = "\(numPushups)"
        dateLabel.text = date
        numSetLabel.text = "\(setNum)"
        
    }
}
