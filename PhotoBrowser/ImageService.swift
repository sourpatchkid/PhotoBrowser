//
//  ImageService.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/12/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import UIKit

class ImageService {
    
    static var shared = ImageService()
    
    var cache:[URL:UIImage] = [:]
    
    
    func imageForURL(url: URL?, completion: @escaping (UIImage?, URL?) -> ()) {
        guard let url = url else { completion(nil, nil); return }
        if let image = cache[url] {
            completion(image, url)
            return
        }
        let task = URLSession(configuration: .ephemeral).dataTask(with: url) { (data, response, error) in
            guard data != nil else { completion(nil, nil); return}
            if error != nil { completion(nil, nil); return }
            let image = UIImage(data: data!)
            if let img = image {
                self.cache[url] = img
            }
            DispatchQueue.main.async {
                completion(image, url)
            }
        }
        task.resume()
    }
    
}
