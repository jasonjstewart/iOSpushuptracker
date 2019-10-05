//
//  WorkOutEntry.swift
//  Pushup Tracker
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct WorkOutEntry{
    
    var date: String
    var numPushups: Int
    var setNum: Int
    
    var propertyList: [Any] {
        return [date, numPushups, setNum]
    }
    
    init(date: String, numPushups: Int, setNum: Int) {
        self.date = date
        self.numPushups = numPushups
        self.setNum = setNum
    }
    
    init?(propertyList: [Any]){
        if propertyList.count != 3 {
            return nil
        }
        
        guard let date = propertyList[0] as? String,
            let numPushups = propertyList[1] as? Int,
            let setNum = propertyList[2] as? Int else{
            return nil
        }
        
        self.date = date
        self.numPushups = numPushups
        self.setNum = setNum
    }
}
