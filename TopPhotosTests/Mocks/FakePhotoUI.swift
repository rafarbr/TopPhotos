//
//  FakePhotoUI.swift
//  TopPhotos
//
//  Created by PH on 05/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import XCTest
@testable import TopPhotos

class FakePhotoUI: PhotoUI, FakeBothamLoadingUI {
    
    var photoDetailViewControllerWasPresented = false
    var photoListWithContent = true
    
    var loaderWasShowed = false
    var loaderWasHided = false
    var itemsShowed: [Photo] = []
    
    var expectation: XCTestExpectation?
    
    init(expectation: XCTestExpectation? = nil) {
        self.expectation = expectation
    }
    
    func showEmptyCase(error: NSError) {
        photoListWithContent = false
        expectation?.fulfill()
    }
    
    func showItems(items: [Photo]) {
        itemsShowed = items
        expectation?.fulfill()
    }
    
    func openPhotoDetailScreen(photoDetailViewController: UIViewController) {
        photoDetailViewControllerWasPresented = true
    }
    
}
