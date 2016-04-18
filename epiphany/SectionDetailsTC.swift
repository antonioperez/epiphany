//
//  SectionDetailsTC.swift
//  epiphany
//
//  Created by Antonio Perez on 4/16/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import UIKit

class SectionDetailsTC: UITableViewCell {
    
    var sectionDetail: IdeaDetail!
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(ideaDetail : IdeaDetail){
        
        self.sectionDetail = ideaDetail
        self.detailTitle.text = self.sectionDetail.subTitle
        self.detailContent.text = self.sectionDetail.content
        
    }
    
    
    

}
