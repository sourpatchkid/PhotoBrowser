//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/9/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var photos: [Photo] = []

  
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        fetchData()
    }
    
    
    
    func fetchData() {
        let sourceURL = URL(string: "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=daffodil&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1:" )!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: sourceURL) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
            // map the dictionary to the array
            self.photos = array.map  { Photo (dictionary: $0) }
            self.photos += self.photos
            self.photos += self.photos
            self.photos += self.photos
            self.photos += self.photos
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        task.resume()
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.configure(photo: photos[indexPath.item])
        return cell
        }
   
    }


