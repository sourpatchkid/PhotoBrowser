//
//  PhotoViewController.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/16/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var photo: Photo?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        ImageService.shared.imageForURL(url: photo?.imageURL) { (image, url) in self.imageView.image = image}
    }
    
    
}

extension PhotoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0    }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameCell
            cell.configure(with: photo)
            return cell
        case 1: fallthrough
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QualitiesCell", for: indexPath) as! QualitiesCell
            cell.configure(with: photo)
            return cell
        }
        
        
        
        
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell" , for: indexPath) as! NameCell
        //        cell.configure(photo)
        //        return cell
    }
    
}

