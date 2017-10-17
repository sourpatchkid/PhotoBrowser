//
//  NameCell.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/16/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with: Photo?) {
        nameLabel.text = with?.title
    }
    
}
