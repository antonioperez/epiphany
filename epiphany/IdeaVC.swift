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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ideasTableView.delegate = self
        ideasTableView.dataSource = self
        ideasTableView.tableFooterView = UIView()
        
        updateUI()
        
        
    }
    
    func updateUI() {
        self.ideaLbl.text = idea?.title
        self.ideaDescripField.text = idea?.slogan
        self.createdLbl.text = idea?.created
        self.updatedLbl.text = "Updated: " + (idea?.modified)!
        self.ideaSections = idea.sections
        
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

