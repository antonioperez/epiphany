//
//  addSectionVC.swift
//  epiphany
//
//  Created by Antonio Perez on 5/17/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class AddSectionVC: UIViewController {

    @IBOutlet weak var addSectionLbl: UILabel!
    @IBOutlet weak var sectionTitle: UITextField!
    @IBOutlet weak var sectionAnswer: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    



}
