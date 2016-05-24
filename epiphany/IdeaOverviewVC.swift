//
//  ViewController.swift
//  epiphany
//
//  Created by Antonio Perez on 4/10/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class IdeaOverviewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ideasTableView: UITableView!
    @IBOutlet weak var ideaLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.ideaSections = idea!.sections
    }
    
    func updateUI() {
        self.ideaLbl.text = idea!.title
        self.createdLbl.text = "Founded: " + idea!.created
        self.updatedLbl.text = "Updated: " + idea!.modified
        
    }
    

    // MARK TABLE FUNCTIONS
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let ideaSection = ideaSections[indexPath.row]
        performSegueWithIdentifier("showSectionOverview", sender: ideaSection)
    
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
    
    //MARK Actions
    
    @IBAction func browseBtnPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK SEGUE
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSectionOverview" {
            if let sectionVC = segue.destinationViewController as? IdeaSectionVC {
                if let ideaSection = sender as? IdeaSection {
                    
                    navigationItem.title = idea!.title
                    
                    sectionVC.ideaSection = ideaSection
                    sectionVC.ideaTitle = idea!.title
                    sectionVC.tabBarController?.delegate = self.tabBarController?.delegate
                
                    
                }
            }
        }
    }

    func setUpViewController(title: String, backgroundColor: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: "star")
        return vc
    }

    
    
}

