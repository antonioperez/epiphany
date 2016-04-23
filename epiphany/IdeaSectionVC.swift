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
    
    @IBOutlet weak var sectionDetailTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sectionDetailTableView.delegate = self
        self.sectionDetailTableView.dataSource = self
        self.sectionDetailTableView.tableFooterView = UIView()
        self.automaticallyAdjustsScrollViewInsets = false;
        
        
        updateUI()
        
        let ideaDetail = IdeaDetail(subTitle: "The Problem", content: "> Hello World \n> test", order: 0)
        self.sectionDetails += [ideaDetail]
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let sectionDetails = ideaSection?.details {
            
            self.sectionDetails += sectionDetails
        }
        
    }
    
    func updateUI(){
        self.navigationController?.title = self.ideaSection.header
                
    }
    
    // MARK TABLE FUNCTIONS
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
    
    //MARK ACTIONS
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
