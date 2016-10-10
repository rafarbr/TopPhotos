//
//  TopPhotosTests.swift
//  TopPhotosTests
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import XCTest
import Nimble
import BothamUI
@testable import TopPhotos

class TopPhotosTests: XCTestCase {
    
    func testShowListOfPhotos() {
        let expectation = self.expectationWithDescription("Photos will be shown")
        let fakePhotoUI = FakePhotoUI(expectation: expectation)
        let presenter = PhotoPresenterImp(ui: fakePhotoUI, repository: FakePhotoRepository(fromJson: API.json))
        
        presenter.viewDidLoad()
        
        waitForExpectationsWithTimeout(10, handler: nil)
        expect(fakePhotoUI.loaderWasShowed).to(beTrue())
        expect(fakePhotoUI.itemsShowed.count).to(equal(6))
        expect(fakePhotoUI.loaderWasHided).to(beTrue())
    }
    
    func testShowListOfPhotosWithoutContent() {
        let expectation = self.expectationWithDescription("Photos will be not shown")
        let fakePhotoUI = FakePhotoUI(expectation: expectation)
        let presenter = PhotoPresenterImp(ui: fakePhotoUI, repository: FakePhotoRepository())        
        presenter.viewDidLoad()
        
        waitForExpectationsWithTimeout(10, handler: nil)
        expect(fakePhotoUI.loaderWasShowed).to(beTrue())
        expect(fakePhotoUI.itemsShowed.isEmpty).to(beTrue())
        expect(fakePhotoUI.loaderWasHided).to(beTrue())
        expect(fakePhotoUI.photoListWithContent).to(beFalse())
    }
    
    func testShowListOfPhotosWithInvalidJsonToPhoto() {
        let photo = Photo(json: ["id": 0, "title": "photo", "thumbnailUrl": "http://placehold.it/150/30ac17", "url": "http://placehold.it/600/92c952"])
        
        expect(photo).to(beNil())
    }


    func testPresentPhotoDetailFromPhotoList() {
        let fakePhotoUI = FakePhotoUI()
        let presenter = PhotoPresenterImp(ui: fakePhotoUI, repository: FakePhotoRepository())
        presenter.itemWasTapped(API.json[0])
        
        expect(fakePhotoUI.photoDetailViewControllerWasPresented).to(beTrue())
    }
    
    func testShowPhotoDetailViewDidLoad() {
        let fakePhotoDetailUI = FakePhotoDetailUI()
        let photo = API.json[0]
        let presenter = PhotoDetailPresenterImp(ui: fakePhotoDetailUI, photo: photo)
        presenter.viewDidLoad()
        
        expect(fakePhotoDetailUI.title).to(equal("ID: \(photo.id)"))
        expect(fakePhotoDetailUI.itemShowed).toNot(beNil())
        expect(fakePhotoDetailUI.itemShowed!.id).to(equal(photo.id))
        expect(fakePhotoDetailUI.itemShowed!.albumId).to(equal(photo.albumId))
        expect(fakePhotoDetailUI.itemShowed!.title).to(equal(photo.title))
    }
    
    func testShowPhotoDetailViewDidAppear() {
        let fakePhotoDetailUI = FakePhotoDetailUI()
        let photo = API.json[0]
        let presenter = PhotoDetailPresenterImp(ui: fakePhotoDetailUI, photo: photo)
        presenter.viewDidAppear()
        
        expect(fakePhotoDetailUI.itemShowed).toNot(beNil())
        expect(fakePhotoDetailUI.itemShowed!.photoUrl).to(equal(photo.photoUrl))
    }

}
