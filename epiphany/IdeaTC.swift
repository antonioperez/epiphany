//
//  IdeaTC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/17/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class IdeaTC: UITableViewCell {
    
    var idea : Idea!

    @IBOutlet weak var ideaLbl: UILabel!
    @IBOutlet weak var ideaSubTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(idea : Idea) {
        self.idea = idea
        self.ideaLbl.text = self.idea.title
        self.ideaSubTitleLbl.text = "Updated 6 min ago"
        self.selectionStyle = .None
        
    }



}
