//
//  IdeaDetail.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation

class IdeaDetail {
    
    private var _id: String!
    private var _subTitle: String!
    private var _content: String?
    private var _order: Int!
    
    var id: String!  {
        return _id
    }
    
    var subTitle: String! {
        return _subTitle
    }
    
    var content: String? {
        return _content
    }
    
    var order: Int! {
        return _order
    }
    
    init(id: String, subTitle: String, content: String, order: Int){
        self._id = id
        self._subTitle = subTitle
        self._content = content
        self._order = order
    }
    
    init(id: String, details: [String: AnyObject]) {
        self._id = id
        
        if let subt = details["subtitle"] as? String {
            self._subTitle = subt
        }
        
        if let content = details["content"] as? String {
            self._content = content
        }
        
        if let order = details["order"] as? Int {
            self._order = order
        }
        
    }
    
}




