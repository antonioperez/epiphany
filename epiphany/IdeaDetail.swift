//
//  IdeaDetail.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation

class IdeaDetail {
    
    private var _id: Int
    private var _subTitle: String
    private var _content: String
    private var _order: Int
    
    var id: Int  {
        return _id
    }
    
    var subTitle: String {
        return _subTitle
    }
    
    var content: String {
        return _content
    }
    
    init(subTitle: String, content: String, order: Int){
        self._id = 1
        self._subTitle = subTitle
        self._content = content
        self._order = order
    }
    
}