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
    private var _ideaHeaders : [IdeaSection]
    
    var title: String {
        return _title
    }
    
    var isSharing: Bool {
        return _isSharing
    }
    
    var ideaHeaders: [IdeaSection] {
        return _ideaHeaders
    }
    
    init(title: String, isSharing: Bool){
        self._title = title
        self._isSharing = isSharing
        self._userId = 1
        self._ideaHeaders = [IdeaSection]()
    }
    
//    func downloadDayDetail(completed: DownloadComplete) {
//        
//        completed()
//    }
    
}