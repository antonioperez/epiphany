//
//  DetailEditorVC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/22/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class DetailEditorVC: UIViewController {
    
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailContent: UITextView!
    
    var ideaDetail : IdeaDetail!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func doneButtonPressed(sender: AnyObject) {
        
        
    }

    @IBAction func imagePickerButton(sender: AnyObject) {
        
    }
}
