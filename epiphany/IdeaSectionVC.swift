//
//  IdeaSectionVC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/16/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit


class IdeaSectionVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sectionDetails = [IdeaDetail]()
    var ideaSection: IdeaSection!
    var ideaTitle = ""
    
    @IBOutlet weak var sectionDetailTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sectionDetailTableView.delegate = self
        self.sectionDetailTableView.dataSource = self
        self.sectionDetailTableView.tableFooterView = UIView()
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.updateUI()
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(IdeaSectionVC.reloadTable), name: "load", object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let sectionDetails = ideaSection?.details {
            self.sectionDetails = sectionDetails
        }
        
        self.sectionDetailTableView.reloadData()
    }
    
    func updateUI(){
        self.title = self.ideaSection.header
      
    }
    
    func reloadTable(notification : NSNotification) {
        self.sectionDetailTableView.reloadData()
    }
    
    //MARK ACTIONS
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    // MARK TABLE FUNCTIONS
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let sectionDetail = sectionDetails[indexPath.row]
        performSegueWithIdentifier("showDetailEditor", sender: sectionDetail)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let sectionDetail = tableView.dequeueReusableCellWithIdentifier("SectionDetailsTC") as? SectionDetailsTC {
            sectionDetail.configureCell(sectionDetails[indexPath.row])
            return sectionDetail
            
        }
        return IdeaSectionTC()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionDetails.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: SEGUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetailEditor" {
            if let detailVC = segue.destinationViewController as? DetailEditorVC {
                if let sectionDetail = sender as? IdeaDetail {
                    detailVC.ideaDetail = sectionDetail
                    
                }
            }
        }

        if segue.identifier == "addSectionDetail" {
            if let addSectionVC = segue.destinationViewController as? AddSectionVC {
                addSectionVC.section = self.ideaSection
                addSectionVC.ideaTitle = ideaTitle
            }
        }
        
        
    }
    
}
