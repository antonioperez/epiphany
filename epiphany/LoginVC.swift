//
//  ViewController.swift
//  perezprogramming
//
//  Created by Antonio Perez on 2/10/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//


//F4511E

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var emailField : UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
       // if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
             //self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        //}
    }
    


    @IBAction func attemptedLogin(sender: UIButton!) {
        
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {

            
        } else {
            
            showErrorAlert(self, title: "Login failed", msg: "You must enter a valid email and password")
        }
    }
    
}

