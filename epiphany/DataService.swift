//
//  Dataservice.swift
//  epiphany
//
//  Created by Antonio Perez on 6/3/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = FIRDatabase.database().reference()

//Global Function that will allow us to have callbacks in a custom function
// ex) callBack after JSON call is done downloading
public typealias DownloadComplete = (AnyObject, AnyObject) -> ()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = URL_BASE
    private var _REF_IDEAS = URL_BASE.child("ideas")
    private var _REF_USERS = URL_BASE.child("users")
    
    var REF_CURRENT_USER : FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = URL_BASE.child("users").child(uid)
        return user
    }
    
    var REF_IDEAS: FIRDatabaseReference {
        return _REF_IDEAS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(user)
    }
    
}













