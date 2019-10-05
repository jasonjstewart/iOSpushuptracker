//
//  WorkoutDetailController.swift
//  Pushup Tracker
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WorkoutDetailController: UIViewController {
    
    var numPushups = 12
    var date = "11/04/2001"
    var setNum = 3
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var numSetLabel: UILabel!
    
    @IBOutlet weak var numPushupsLabel: UILabel!
    
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
