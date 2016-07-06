//
//  ViewController.swift
//  perezprogramming
//
//  Created by Antonio Perez on 2/10/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//


//F4511E

import UIKit
import Firebase


class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailField : UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
             self.performSegueWithIdentifier("login", sender: nil)
        }
    }
    
    @IBAction func attemptedLogin(sender: AnyObject!) {
        
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
           FIRAuth.auth()?.signInWithEmail(email, password: pwd) { user, error in
            
                guard let user = user else {
                    
                    if error?.code == STATUS_ACCOUNT_NONEXIST {
                        showErrorAlert(self, title: "Login failed", msg: ERROR_ACCOUNT_NONEXIST)
                    } else {
                        showErrorAlert(self, title: "Login failed", msg: ERROR_LOGIN)
                    }
                    
                    return;
                }

                let userData = ["provider": "email"]
                DataService.instance.createFirebaseUser(user.uid, user: userData)
                NSUserDefaults.standardUserDefaults().setValue(user.uid, forKey: KEY_UID)
                self.performSegueWithIdentifier("login", sender: nil)
            }
        } else {
            showErrorAlert(self, title: "Login failed", msg: ERROR_LOGIN)
        }
    }

}

