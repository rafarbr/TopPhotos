//
//  TopPhotosUITests.swift
//  TopPhotosUITests
//
//  Created by PH on 06/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import XCTest
import UIKit
import KIF
import Nimble
@testable import TopPhotos

class TopPhotosUITests: AcceptanceTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testShowsTheExactNumberOfPhotos() {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openPhotoListViewController(fromRepository: FakePhotoRepository(fromJson: API.json))
            let tableView = tester().waitForViewWithAccessibilityLabel("PhotoListTableView") as! UITableView
            expect(tableView.numberOfRowsInSection(0)).to(equal(API.json.count))
        }
        else {
            openPhotoCollectionViewController(fromRepository: FakePhotoRepository(fromJson: API.json))
            let collectionView = tester().waitForViewWithAccessibilityLabel("PhotoCollectionView") as! UICollectionView
            expect(collectionView.numberOfItemsInSection(0)).to(equal(API.json.count))
        }
    }
    
    func testShowsPhotoTitlesIfThereArePhotos()
    {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            
            openPhotoListViewController(fromRepository: FakePhotoRepository(fromJson: API.json))
            
            for photo in API.json {
                let cell = tester().waitForViewWithAccessibilityLabel("\(photo.id)-Identifier") as! PhotoTableViewCell
                expect(cell.titleLabel?.text).to(equal(photo.title))
            }
        }
        else {
            openPhotoCollectionViewController(fromRepository: FakePhotoRepository(fromJson: API.json))
            
            for photo in API.json {
                let photoTitleLabel = tester().waitForViewWithAccessibilityLabel(photo.title) as! UILabel
                expect(photoTitleLabel.text).to(equal(photo.title))
            }
        }
    }
    
    func testShouldShowEmptyView() {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openPhotoListViewController(fromRepository: FakePhotoRepository())
        }
        else {
            openPhotoCollectionViewController(fromRepository: FakePhotoRepository())
        }
        let emptyView = tester().waitForViewWithAccessibilityLabel("EmptyView")
        expect(emptyView.hidden).to(beFalse())
    }
    
    func testShouldShowAlertController() {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openPhotoListViewController(fromRepository: FakePhotoRepository())
        }
        else {
            openPhotoCollectionViewController(fromRepository: FakePhotoRepository())
        }
        tester().waitForViewWithAccessibilityLabel(kErrorDescriptionConstant)
    }
    
    func testShouldShowAlertControllerAndTapTryAgain() {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openPhotoListViewController(fromRepository: FakePhotoRepository())
        }
        else {
            openPhotoCollectionViewController(fromRepository: FakePhotoRepository())
        }
        tester().waitForViewWithAccessibilityLabel(kErrorDescriptionConstant)
        tester().tapViewWithAccessibilityLabel("OK", traits: UIAccessibilityTraitButton)
    }
    
    func testNavigationToDetailPhoto() {
        let photo = API.json[0]
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openPhotoListViewController(fromRepository: FakePhotoRepository(fromJson: API.json))
            let tableView = tester().waitForViewWithAccessibilityLabel("PhotoListTableView") as! UITableView
            tester().tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableView: tableView)
            tester().waitForAnimationsToFinish()
            let photoTitleLabel = tester().waitForViewWithAccessibilityLabel(photo.title) as! UILabel
            expect(photoTitleLabel.text).to(equal(photo.title))
        }
        else {
            openPhotoCollectionViewController(fromRepository: FakePhotoRepository(fromJson: API.json))
            let collectionView = tester().waitForViewWithAccessibilityLabel("PhotoCollectionView") as! UICollectionView
            tester().tapItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inCollectionView: collectionView)
            tester().waitForAnimationsToFinish()
            let photoTitleLabel = tester().waitForViewWithAccessibilityLabel(photo.title) as! UILabel
            expect(photoTitleLabel.text).to(equal(photo.title))
        }
    }

    private func openPhotoListViewController(fromRepository repository: PhotoRepository) {
        let photoViewController = ServiceLocator().photoListViewController() as! PhotoListViewController
        
        photoViewController.presenter = PhotoPresenterImp(ui: photoViewController, repository: repository)
        
        let rootViewController = UINavigationController(rootViewController: photoViewController)
        presentViewController(rootViewController)
        
        tester().waitForAnimationsToFinish()
    }
    
    private func openPhotoCollectionViewController(fromRepository repository: PhotoRepository) {
        let photoCollectionViewController = ServiceLocator().photoCollectionViewController() as! PhotoCollectionViewController
        
        photoCollectionViewController.presenter = PhotoPresenterImp(ui: photoCollectionViewController, repository: repository)
        
        let rootViewController = UINavigationController(rootViewController: photoCollectionViewController)
        presentViewController(rootViewController)
        
        tester().waitForAnimationsToFinish()
    }

    
}
