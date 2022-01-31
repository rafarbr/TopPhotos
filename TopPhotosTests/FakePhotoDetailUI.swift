//
//  FakePhotoDetailUI.swift
//  TopPhotos
//
//  Created by PH on 06/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import XCTest
@testable import TopPhotos

class FakePhotoDetailUI: PhotoDetailUI {
    
    var itemShowed: Photo?
    
    var title: String?
    
    func showPhoto(photo: Photo) {
        itemShowed = photo
    }
    
    func showPhotoInformation(photo: Photo) {
        itemShowed = photo
    }
    
}
