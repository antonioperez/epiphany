//
//  ViewController.swift
//  epiphany
//
//  Created by Antonio Perez on 4/10/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class IdeaVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var ideasTableView: UITableView!
    @IBOutlet weak var ideaLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
    @IBOutlet weak var ideaDescripField: UITextView!
    @IBOutlet weak var updatedLbl: UILabel!
    
    
    var ideaSections = [IdeaSection]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ideasTableView.delegate = self
        ideasTableView.dataSource = self
        ideasTableView.tableFooterView = UIView()
        
        
        let initIdeaSection = IdeaSection(header: "Pitch", order: 0, color: "green")
        let marketIdeaSection = IdeaSection(header: "Market", order: 1, color: "brown")
        let productIdeaSection = IdeaSection(header: "Product", order: 2, color: "yellow")
        let modelIdeaSection = IdeaSection(header: "Financial", order: 3, color:  "orange")
        let execIdeaSection = IdeaSection(header: "Execution", order: 4, color: "red")
        
        self.ideaSections += [initIdeaSection, marketIdeaSection, productIdeaSection, modelIdeaSection, execIdeaSection]
    }
    
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

