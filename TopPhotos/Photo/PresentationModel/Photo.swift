//
//  Photo.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Photo {
    let id: Int
    let albumId: Int
    let title: String?
    let thumbnailUrl: String?
    let photoUrl: String?
    
    init?(json: JSON) {
        
        guard let
            id = json["id"].int,
            albumId = json["albumId"].int,
            title = json["title"].string,
            thumbnailUrl = json["thumbnailUrl"].string,
            photoUrl = json["url"].string
            else {
                return nil
        }
        
        self.id = id
        self.albumId = albumId
        self.title = title
        self.thumbnailUrl = thumbnailUrl
        self.photoUrl = photoUrl
        
    }

}
