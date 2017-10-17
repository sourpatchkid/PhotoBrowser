//
//  PhotoCell.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/12/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    var photo: Photo?
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    
    func configure(photo: Photo) {
        self.photo = photo
        ImageService.shared.imageForURL(url: photo.imageURL) { (image, url) in
            if url == self.photo?.imageURL{
                self.imageView.image = image
            }
        }
        
    }
}
