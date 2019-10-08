//
//  AddWorkoutController.swift
//  Pushup Tracker
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddWorkoutController: UITableViewController{
    
//MARK - properties
    var date: String = "" //= "11-04-2093"
    var setNum: Int = 0 //= 0
    var numberPushups: Int = 0 //= 0

    
//MARK - Outlets
    @IBOutlet weak var datePickerLabel: UIDatePicker!
    //
    @IBOutlet weak var numberPushupsLabel: UITextField!
    
    @IBOutlet weak var setNumberLabel: UITextField!
  
}
