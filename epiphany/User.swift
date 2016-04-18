//
//  User.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation

class User{
    
    private var _id: Int
    private var _email: String
    private var _password: String
    private var _IdeasMade : Int
    private var _isActive: Bool
    private var _ideas : [Idea]
    
    var email: String {
        return _email
    }
    
    var ideasMade : Int{
        return _IdeasMade
    }
    
    var isActive: Bool {
        return _isActive
    }
    
    var ideas: [Idea] {
        return _ideas
    }
    
    init(email: String, password: String){
        self._email = email
        self._password = password
        self._IdeasMade = 1
        self._isActive = true
        self._id = 1
        self._ideas = [Idea]()
    }

}