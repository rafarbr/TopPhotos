//
//  PhotoRepository.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol PhotoRepository {
    func getAll(completion: Result<[Photo], NSError> -> Void)
}

class PhotoRepositoryImp: PhotoRepository {
    
    func getAll(completion: Result<[Photo], NSError> -> Void) {
        
        Alamofire.request(.GET, "https://jsonplaceholder.typicode.com/photos").responseJSON { response in
            
            if let responseValue = response.result.value {
                
                if let entry = JSON(responseValue).array {
                    
                    var photos: [Photo] = []
                    for json in entry {
                        if let photo = Photo(json: json) {
                            photos.append(photo)
                        }
                    }
                    
                    completion(.Success(photos))
                }
            } else {
                if let error = response.result.error {
                    completion(.Failure(error))
                }                
            }
        }
    }

    
}
