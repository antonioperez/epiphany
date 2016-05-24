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
    @IBOutlet weak var helpText: UITextView!
    
    
    var sectionDetails = [IdeaDetail]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI(){

        
    }
    
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        
        let ideaDetail = IdeaDetail(subTitle: "New", content: "", order: 2)
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    //MARK Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addSectionDetail" {
            if let detailVC = segue.destinationViewController as? IdeaSectionVC {
                if let ideaDetail = sender as? IdeaDetail {
                    detailVC.sectionDetails.append(ideaDetail)
                    
                }
            }
        }
    }


}
