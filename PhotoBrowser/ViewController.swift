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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchData()
    }
    
    
    
    func fetchData() {
        self.activityIndicator.startAnimating()
        let sourceURL = URL(string: "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=daffodil&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1:" )!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: sourceURL) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [String: Any]
            let topLevel = array["photos"] as! [String: Any]
            let container = topLevel["photo"] as! [[String: Any]]
            self.photos = container.map  { Photo (dictionary: $0) }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
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

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PhotoViewController = storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        PhotoViewController.photo = photos[indexPath.item]
        present(PhotoViewController, animated: true, completion: nil)
    }
}


