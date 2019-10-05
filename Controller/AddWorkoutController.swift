//
//  AddWorkoutController.swift
//  Pushup Tracker
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddWorkoutController: UITableViewController{

    @IBOutlet weak var datePickerLabel: UIDatePicker!
    //
    @IBOutlet weak var numberPushupsLabel: UITextField!
    
    @IBOutlet weak var setNumberLabel: UITextField!

    var date: String = "" //= "11-04-2093"
    var setNum: Int = 0 //= 0
    var numberPushups: Int = 0 //= 0

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let navVC = segue.destination as? UINavigationController {
//            if let mainVC = navVC.topViewController as? MainController{
//                    //updateWorkout()
//                    let workout = WorkOutEntry(date: date, numPushups: numberPushups, setNum: setNum)
//                    mainVC.model.append(workout)
//            }
//        }
//    }
    
    
    
  
}
