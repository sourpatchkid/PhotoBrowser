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
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    
    func configure(photo: Photo) {
        self.photo = photo
        nameLabel.text = photo.title
        // where the imageURL is created
//        let imageURL = URL(string: "https://farm" + "\(photo.farm)" + ".static.flickr.com/" + "\(photo.server)" + "/" + "\(photo.id)" + "_" + "\(photo.secret)" + ".jpg")
        let imageURL = URL(string: "https://farm" + "\(photo.farm)" + ".static.flickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret + ".jpg") ?? URL(string: "https://ichef-1.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg")

        ImageService.shared.imageForURL(url: imageURL) { (image, url) in
           // where image is placed on the view
            self.imageView.image = image

        }
        
    }
}
