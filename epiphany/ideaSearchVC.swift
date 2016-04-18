//
//  ideaSearchVC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/17/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class ideaSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var ideaSearchbar: UISearchBar!
    @IBOutlet weak var ideasTableView: UITableView!
    
    var ideas = [Idea]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ideasTableView.tableFooterView = UIView()
        self.ideasTableView.delegate = self
        self.ideasTableView.dataSource = self
        
        let idea1 = Idea(title: "Snapchat", isSharing: true)
        let initIdeaSection = IdeaSection(header: "Pitch", order: 0, color: "green")
        let marketIdeaSection = IdeaSection(header: "Market", order: 1, color: "brown")
        let productIdeaSection = IdeaSection(header: "Product", order: 2, color: "yellow")
        let modelIdeaSection = IdeaSection(header: "Financial", order: 3, color:  "orange")
        let execIdeaSection = IdeaSection(header: "Execution", order: 4, color: "red")
        
        idea1.sections += [initIdeaSection, marketIdeaSection, productIdeaSection, modelIdeaSection, execIdeaSection]
        ideas += [idea1]
        

    
    
    }
    
    
    // MARK TABLE FUNCTIONS
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let ideaCell = tableView.dequeueReusableCellWithIdentifier("IdeaTC") as? IdeaTC {
            ideaCell.configureCell(ideas[indexPath.row])
            return ideaCell
        }
        return IdeaTC()
    
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showIdeaOverview", sender: ideas[indexPath.row])
        
    }
    
    // MARK SEGUE
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showIdeaOverview" {
            if let ideaVC = segue.destinationViewController as? IdeaVC {
                if let ideaData = sender as? Idea {
                    ideaVC.transferIdea = ideaData
                }
                
            }
        }
    }


}
