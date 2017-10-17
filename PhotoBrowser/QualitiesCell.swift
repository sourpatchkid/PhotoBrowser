//
//  QualitiesCell.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/16/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import UIKit

class QualitiesCell: UITableViewCell {
    
    @IBOutlet weak var familyCell: UILabel!
    @IBOutlet weak var friendsCell: UILabel!
    @IBOutlet weak var publicCell: UILabel!
    
    func configure(with: Photo?) {
        
        
        if with?.isFamily == true {
            familyCell.backgroundColor = UIColor.green.withAlphaComponent(0.6)
        } else {
            familyCell.backgroundColor = UIColor.black.withAlphaComponent(0.25) }
        if with?.isFriend == true {
            friendsCell.backgroundColor = UIColor.green.withAlphaComponent(0.6)
        } else {
            friendsCell.backgroundColor = UIColor.black.withAlphaComponent(0.25) }
        if with?.isPublic == true {
            publicCell.backgroundColor = UIColor.green.withAlphaComponent(0.6)
        } else {
            publicCell.backgroundColor = UIColor.black.withAlphaComponent(0.25) }
    }
    
}


