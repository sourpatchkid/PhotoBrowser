//
//  Photo.swift
//  PhotoBrowser
//
//  Created by Wyatt Allen on 10/12/17.
//  Copyright © 2017 Wyatt Allen. All rights reserved.
//

import Foundation

struct Photo {
    
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isPublic: Bool
    let isFriend: Bool
    let isFamily: Bool
    
    init(id: String, owner: String, secret: String, server: String, farm: Int, title: String, isPublic: Bool, isFriend: Bool, isFamily: Bool ) {
        
        // how to ignore header???? do I need to??
        
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.isPublic = isPublic
        self.isFriend = isFriend
        self.isFamily = isFamily
        
    }
    
    init(dictionary: [String: Any]) {
        
        let id = dictionary["id"] as! String
        let owner = dictionary["owner"] as! String
        let secret = dictionary["secret"] as! String
        let server = dictionary["server"] as! String
        let farm = dictionary["farm"] as! Int
        let title = dictionary["title"] as! String
        let isPublic = dictionary["ispublic"] as! Bool
        let isFriend = dictionary["isfriend"] as! Bool
        let isFamily = dictionary["isfamily"] as! Bool
        
        self.init(id: id, owner: owner, secret: secret, server: server, farm: farm, title: title, isPublic: isPublic, isFriend: isFriend, isFamily: isFamily)
        
    }
    
}
