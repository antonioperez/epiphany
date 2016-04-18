//
//  ViewController.swift
//  epiphany
//
//  Created by Antonio Perez on 4/10/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class IdeaVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ideasTableView: UITableView!
    @IBOutlet weak var ideaLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
    @IBOutlet weak var ideaDescripField: UITextView!
    @IBOutlet weak var updatedLbl: UILabel!
    
    
    var ideaSections = [IdeaSection]()
    var idea : Idea!
    var transferIdea: Idea!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.idea = transferIdea
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ideasTableView.delegate = self
        ideasTableView.dataSource = self
        ideasTableView.tableFooterView = UIView()
        
        updateUI()
        
        
    }
    
    func updateUI() {
        self.ideaLbl.text = idea?.title
        self.createdLbl.text = "2016/23/23"
        self.updatedLbl.text = " 5 Min ago"
        self.ideaDescripField.text = "Hell World, building tech to new tech"
        self.ideaSections = self.idea.sections
        
    }
    

    // MARK TABLE FUNCTIONS
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let ideaSectionCell = tableView.dequeueReusableCellWithIdentifier("IdeaSectionTC") as? IdeaSectionTC {
            
            ideaSectionCell.configureCell(ideaSections[indexPath.row])
            
            return ideaSectionCell
            
        }
        return IdeaSectionTC()
        

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideaSections.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}

