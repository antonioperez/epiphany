//
//  NotificationLib.swift
//  epiphany
//
//  Created by Antonio Perez on 6/5/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation
import UIKit


func showErrorAlert(view: UIViewController, title: String, msg: String){
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    view.presentViewController(alert, animated: true, completion: nil)
}