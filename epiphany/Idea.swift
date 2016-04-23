//
//  Idea.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation


class Idea {
    
    private var _userId: Int
    private var _title: String
    private var _isSharing: Bool
    private var _sections : [IdeaSection]
    private var _created : String
    private var _modified : String
    
    var title: String {
        return _title
    }
    
    var isSharing: Bool {
        return _isSharing
    }
    
    var created: String {
        return _created
    }
    
    var modified: String {
        get {
            return _modified
        } set {
            
        }
    }
    
    var sections: [IdeaSection] {
        get {
            return _sections
        } set {
            _sections = newValue
        }
    }
    
    init(title: String, isSharing: Bool){
        self._title = title
        self._isSharing = isSharing
        self._userId = 1
        self._sections = [IdeaSection]()
        self._created = ""
        self._modified = ""
    
        let convertDate = self.createUTC()
        self._created = convertDate
        self._modified = convertDate
    }
    
    func createUTC() -> String {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:MM:SS"
        let currDate =  dateFormatter.stringFromDate(currentDate)
        return currDate
    }
    
    func getDateFromString(dateString: String, format:String) -> NSDate {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(dateString)!
        
    }
    
    func getDateDiff(date1: NSDate, date2: NSDate) -> String {
        
        let dateComponentsFormatter = NSDateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Full
        
        let interval = date2.timeIntervalSinceDate(date1)
        return dateComponentsFormatter.stringFromTimeInterval(interval)!
    }
    
//    func downloadDayDetail(completed: DownloadComplete) {
//        
//        completed()
//    }
    
}