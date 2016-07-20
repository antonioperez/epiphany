//
//  IdeaHeader.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation

class IdeaSection {
    
    private var _ideaId: String!
    private var _header: String?
    private var _order: Int?
    private var _color: String?
    
    var ideaId: String!  {
        return _ideaId
    }
    
    var header: String? {
        get {
            return _header
        } set {
            _header = newValue
        }
    }
    
    var color: String? {
        return _color
    }
    
    var ideaDetails = [IdeaDetail]()
        
    init(id: String, header: String, order: Int, color: String, ideaDetails : [IdeaDetail]){
        self._ideaId = id
        self._header = header
        self._order = order
        self.ideaDetails = ideaDetails
        self._color = color
    }
    
    init(id: String, dictionary: [String: AnyObject]){
        
        self._ideaId = id
        
        if let header = dictionary["header"] as? String {
            self._header = header
        }
        
        if let order = dictionary["order"] as? Int {
            self._order = order
        }
        
        if let color = dictionary["color"] as? String {
            self._color = color
        }
        
        
        if let ideaDetails = dictionary["details"] as? [String: AnyObject] {
            
            let count = ideaDetails.count-1
            if count >= 0 {
                for (id, detail) in ideaDetails {
                    
                    let sectionDetail = IdeaDetail(id: id, details: detail as! [String : AnyObject])
                    
                    self.ideaDetails.append(sectionDetail)
                }
            }
        }
        
    }
}



