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
    
    
    
    var ideaTitle = ""
    var section : IdeaSection!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI(){
        
        if let sect = self.section {
                    
            helpText.text = "Add a topic under the \(sect.header) section of the \(ideaTitle) idea!"
            
        }

        
    }
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        
        let ideaDetail = IdeaDetail(subTitle: "New", content: "fjdnfksj ", order: 2)
        //DataService.instance.ideas[0].sections[0].details.append(ideaDetail)
        //NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
