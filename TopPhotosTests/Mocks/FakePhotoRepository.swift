//
//  MockPhotoRepository.swift
//  TopPhotos
//
//  Created by PH on 05/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
@testable import TopPhotos

//"albumId": 1,
//"id": 1,
//"title": "accusamus beatae ad facilis cum similique qui sunt",
//"url": "http://placehold.it/600/92c952",
//"thumbnailUrl": "http://placehold.it/150/30ac17"
public struct API{
    static let json: [Photo] = {
        var photos = [Photo]()
        for i in 1 ... 6 {
            let photo = Photo(json: ["id": i, "albumId": i, "title": "photo \(i)", "thumbnailUrl": "http://placehold.it/150/30ac17", "url": "http://placehold.it/600/92c952"])
            photos.append(photo!)
        }
        return photos;
    }()
}

let kErrorDescriptionConstant:String = "No Content"

class FakePhotoRepository: PhotoRepositoryImp {
    
    private var jsonPhotos: [Photo]
    
    init(fromJson json: [Photo]) {
        jsonPhotos = json
    }
    
    convenience override init() {
        self.init(fromJson:[])
    }
    
    override func getAll(completion: Result<[Photo], NSError> -> Void) {
        if jsonPhotos.isEmpty {
            return completion(.Failure(NSError(domain: "FakePhotoRepository", code: 404, userInfo: [
                NSLocalizedDescriptionKey: kErrorDescriptionConstant
                ])))
        } else {
            return completion(.Success(jsonPhotos))
        }
        
    }
    
}
