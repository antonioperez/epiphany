//
//  IdeaHeader.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation

class IdeaSection {
    
    private var _ideaId: Int
    private var _header: String
    private var _order: Int
    private var _ideaDetails: [IdeaDetail]
    private var _color: String
    
    var ideaId: Int  {
        return _ideaId
    }
    
    var header: String {
        get {
            return _header
        } set {
            _header = newValue
        }
    }
    
    var color: String {
        return _color
    }
    
    var details: [IdeaDetail] {
        get {
            return _ideaDetails
        } set {
            _ideaDetails = newValue
        }
    }
        
    init(header: String, order: Int, color: String){
        self._ideaId = 1
        self._header = header
        self._order = order
        self._ideaDetails = [IdeaDetail]()
        self._color = color
    }

}