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
    
    var title: String {
        return _title
    }
    
    var isSharing: Bool {
        return _isSharing
    }
    
    var sections: [IdeaSection] {
        get {
            return _sections
        }
        set {
            _sections = newValue
        }
    }
    
    init(title: String, isSharing: Bool){
        self._title = title
        self._isSharing = isSharing
        self._userId = 1
        self._sections = [IdeaSection]()
    }
    
    
//    func downloadDayDetail(completed: DownloadComplete) {
//        
//        completed()
//    }
    
}