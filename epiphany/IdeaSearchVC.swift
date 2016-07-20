//
//  ideaSearchVC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/17/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit
import Firebase

class IdeaSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var ideasTableView: UITableView!
    
    var ideas = [Idea]()
    var filteredIdeas = [Idea]()
    var isInSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = WHITE_COLOR
        
        self.ideasTableView.tableFooterView = UIView()
        self.ideasTableView.delegate = self
        self.ideasTableView.dataSource = self
        self.searchBar.delegate = self
    
        DataService.instance.REF_IDEAS.observeEventType(.Value, withBlock: { snapshot in

            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let ideaDic = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let ideas = Idea(ideaKey: key, dictionary: ideaDic)
                        self.ideas.append(ideas)
                    }
                }
                
            }
            self.ideasTableView.reloadData()
        })
        
//        let idea1 = Idea(title: "Snapchat", isSharing: true)
//        let initIdeaSection = IdeaSection(header: "Pitch", order: 0, color: "green")
//        let marketIdeaSection = IdeaSection(header: "Market", order: 1, color: "brown")
//        let productIdeaSection = IdeaSection(header: "Product", order: 2, color: "yellow")
//        let modelIdeaSection = IdeaSection(header: "Financial", order: 3, color:  "orange")
//        let execIdeaSection = IdeaSection(header: "Execution", order: 4, color: "red")
//        let idea2 = Idea(title: "Facebook", isSharing: true)
//        
//        idea1.sections = [initIdeaSection, marketIdeaSection, productIdeaSection, modelIdeaSection, execIdeaSection]
//        idea2.sections = [initIdeaSection, marketIdeaSection, productIdeaSection, modelIdeaSection, execIdeaSection]
//        
//        let ideaDetail = IdeaDetail(subTitle: "The Problem", content: "> Hello World \n> test", order: 0)
//        idea1.sections![0].details = [ideaDetail]
        
        //DataService.instance.ideas = [idea1, idea2]
        //ideas +=  DataService.instance.ideas
        
    }
    
    // MARK TABLE FUNCTIONS
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let ideaCell = tableView.dequeueReusableCellWithIdentifier("IdeaTC") as? IdeaTC {
            
            let idea : Idea!
            if isInSearchMode {
                idea = filteredIdeas[indexPath.row]
            } else {
                idea = ideas[indexPath.row]
            }
            ideaCell.configureCell(idea)
            return ideaCell
        }
        return IdeaTC()
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isInSearchMode {
            return filteredIdeas.count
        }
        return ideas.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let idea = ideas[indexPath.row]        
        performSegueWithIdentifier("showIdeaOverview", sender: idea)
        
    }
    
    //MARK Search functions
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if self.searchBar.text == nil || searchBar.text == "" {
            isInSearchMode = false
            view.endEditing(true)
            ideasTableView.reloadData()
        } else {
            isInSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredIdeas = ideas.filter({$0.title.lowercaseString.rangeOfString(lower) != nil})
            ideasTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    // MARK SEGUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showIdeaOverview" {
            if let ideaVC = segue.destinationViewController as? IdeaOverviewVC {
                if let ideaData = sender as? Idea {
                    ideaVC.idea = ideaData
                    navigationItem.title = "Browse"
                }
            }
        }
    }


}
