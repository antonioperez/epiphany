//
//  Idea.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation
import Firebase

class Idea {
    
    private var _userId: Int!
    private var _title: String!
    private var _isSharing: Bool!
    private var _created : String!
    private var _modified : String!
    
    private var _ideaRef: FIRDatabaseReference!
    private var _ideaKey: String!
    
    var ideaKey: String! {
        return _ideaKey
    }
    
    var ideaRef: FIRDatabaseReference! {
        return _ideaRef
    }
    
    var title: String! {
        return _title
    }
    
    var isSharing: Bool! {
        return _isSharing
    }
    
    var created: String! {
        return _created
    }
    
    var modified: String! {
        get {
            return _modified
        } set {
            
        }
    }
    
    var sections = [IdeaSection]()
    
    init(title: String, isSharing: Bool){
        self._title = title
        self._isSharing = isSharing
        self._userId = 1
        self._created = ""
        self._modified = ""
    
        let convertDate = self.createUTC()
        self._created = convertDate
        self._modified = convertDate

    }
    
    init(ideaKey: String, dictionary: [String:AnyObject]){
        self._ideaKey = ideaKey
        self._userId = 1
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let isSharing = dictionary["isSharing"] as? Bool {
            self._isSharing = isSharing
        }
        
        if let sections = dictionary["sections"] as? [String:AnyObject] {
            
            let count = sections.count-1
            if count >= 0 {
                for (id, section) in sections {
                    
                    let sect = IdeaSection(id: id, dictionary: section as! [String : AnyObject])
                    self.sections.append(sect)
                }
            }
        }

        let convertDate = self.createUTC()
        self._created = convertDate
        self._modified = convertDate
        
        self._ideaRef = DataService.instance.REF_IDEAS.child(self._ideaKey)
    }
    
    
    func update(title: String, sections: [IdeaSection]){
        self._title = title
        self.sections = sections
        let convertDate = self.createUTC()
        self._modified = convertDate
        
        _ideaRef.child("sections").setValue(sections)
        _ideaRef.child("title").setValue("title")
        
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
    
}