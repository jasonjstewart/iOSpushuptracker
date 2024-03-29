//
//  MainController.swift
//  Pushup Tracker
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import Foundation

class MainController: UITableViewController {
    
// MARK - Properites
    var model: [WorkOutEntry] = []
    //var workoutIndex = 0
    var sumPushups = 0
    
    private struct Storyboard{
        static let cellIdentifier = "PushupDate"
        static let segueIdentifier = "ShowSegue"
    }
    
    public struct key{
        static let workout = "workout"
        static let workouts = "workouts"
    }
    
//MARK - Methods needed for the segues and ViewDidLoad
    
    @IBAction func exitScene(_ segue: UIStoryboardSegue){
        //in this case, this is nothin to do but we need a target
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeModel()
        saveModel()
        loadModel()
        totalPushups()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController {
            if let detailVC = navVC.topViewController as? WorkoutDetailController{
  
                if let indexPath = sender as? IndexPath {
                    detailVC.date = model[indexPath.row].date
                    detailVC.numPushups = model[indexPath.row].numPushups
                    detailVC.setNum = model[indexPath.row].setNum
                }
            }
        }
    }
    
    @IBAction func exitAndSaveRecordScene(_ segue: UIStoryboardSegue){
        if let addWorkoutVC = segue.source as? AddWorkoutController{
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/dd/yyy"
            addWorkoutVC.date = dateformatter.string(from: addWorkoutVC.datePickerLabel.date)

            let formatter = NumberFormatter()
            
            if let stringPushups = addWorkoutVC.numberPushupsLabel.text {
                if let nsIntPushups = formatter.number(from: stringPushups) as? Int {
                    addWorkoutVC.numberPushups = nsIntPushups
                }
            }

            if let stringSet = addWorkoutVC.setNumberLabel.text {
                if let nsIntSet = formatter.number(from: stringSet) as? Int {
                    addWorkoutVC.setNum = nsIntSet
                }
            }
            model.append(WorkOutEntry(date: addWorkoutVC.date, numPushups: addWorkoutVC.numberPushups, setNum: addWorkoutVC.setNum))
            
            tableView.reloadData()
            totalPushups()
            saveModel()
        }
    }
    
    private func totalPushups(){
        sumPushups = 0
        for workout in model{
            sumPushups = workout.numPushups+sumPushups
        }
        
        
    }
    
    //MARK - Restore State
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        if let savedWorkouts = coder.decodeObject(forKey: key.workouts) as? [WorkOutEntry]{
            model = savedWorkouts
        }
        //workouts = coder.decodePropertyList(forKey: workouts)
        
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        coder.encode(UserDefaults.standard.array(forKey: key.workout), forKey: key.workouts)
    }
}



//MARK - Table View Delegate

extension MainController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.segueIdentifier, sender: indexPath)
    }
}
    
//MARK - Table View Source

extension MainController{
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(model[indexPath.row].date)"
        cell.detailTextLabel?.text = "\(model[indexPath.row].numPushups)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Total Number of Pushups: \(sumPushups)"
    }

}

//MARK - Models, save and load, initialize

extension MainController{
    
    private func loadModel(){
        if let storedModel = UserDefaults.standard.array(forKey: key.workout) as? [[WorkOutEntry]]{
            //model.removeAll()
            
            for propertyListWorkout in storedModel {
                if let workout = WorkOutEntry(propertyList: propertyListWorkout){
                    model.append(workout)
                }
                
            }
        }
        
    }
    
    private func saveModel(){
        UserDefaults.standard.set(model.map{ $0.propertyList }, forKey: key.workout)
    }
    
    private func initializeModel(){
        //model.removeAll()
        totalPushups()
        
    }
}
