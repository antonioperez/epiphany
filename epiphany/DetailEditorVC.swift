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
        updateUI()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK actions
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func imagePickerButton(sender: AnyObject) {
        
    }
    
    //mark: functions
    func updateUI(){
        
        if let ideaDetails = self.ideaDetail {
            self.detailTitle.text = ideaDetails.subTitle
            self.detailContent.text = ideaDetails.content
        }
    }
}
