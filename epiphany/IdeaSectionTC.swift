//
//  IdeaTableCell.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class IdeaSectionTC: UITableViewCell {
    
    var ideaSection: IdeaSection!
    
    @IBOutlet weak var ideaSectionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func configureCell(ideaSection: IdeaSection){
        self.ideaSection = ideaSection
        self.ideaSectionLbl.text = self.ideaSection.header
        self.selectionStyle = .None
        let cellColor = self.ideaSection.color!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).uppercaseString
        
        if cellColor == "GREEN" {
            self.backgroundColor = GREEN_COLOR
            
        } else if cellColor == "BROWN" {
            self.backgroundColor = BROWN_COLOR
            
        } else if cellColor == "YELLOW" {
            self.backgroundColor = YELLOW_COLOR
            
        } else if cellColor == "ORANGE" {
            self.backgroundColor = ORANGE_COLOR
            
        } else if cellColor == "RED" {
            self.backgroundColor = RED_COLOR
            
        } else {
            self.backgroundColor = UIColor.darkGrayColor()
        }
        
        
    }
    
    
}
