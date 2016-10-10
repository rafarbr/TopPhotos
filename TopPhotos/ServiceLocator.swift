//
//  ServiceLocator.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class ServiceLocator {
    
    private func storyBoard() -> BothamStoryboard {
        return BothamStoryboard(name: "Main")
    }
    
    func rootViewController() -> UIViewController {
        let navigationController: UINavigationController = storyBoard().initialViewController()
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad {
            navigationController.viewControllers = [photoCollectionViewController()]
        }
        else {
            navigationController.viewControllers = [photoListViewController()]
        }
        
        return navigationController
    }
    
    // MARK: Photos
    
    func photoListViewController() -> UIViewController {
        let photoViewController: PhotoListViewController = storyBoard().instantiateViewController("PhotoListViewController")
        let presenter = photoPresenter(photoViewController)
        let datasource = photoListDataSource()
        
        photoViewController.presenter = presenter
        photoViewController.dataSource = datasource
        photoViewController.delegate = PhotoTableViewNavigationDelegate(dataSource: datasource, presenter: presenter)
        return photoViewController
    }
    
    func photoCollectionViewController() -> UIViewController {
        let photoViewController: PhotoCollectionViewController = storyBoard().instantiateViewController("PhotoCollectionViewController")
        let presenter = photoPresenter(photoViewController)
        let datasource = photoCollectionDataSource()
        
        photoViewController.presenter = presenter
        photoViewController.dataSource = datasource
        photoViewController.delegate = PhotoCollectionViewNavigationDelegate(dataSource: datasource, presenter: presenter)
        return photoViewController
    }
    
    private func photoPresenter(viewController: PhotoUI) -> PhotoPresenterImp {
        let repository = PhotoRepositoryImp()
        return PhotoPresenterImp(ui: viewController, repository: repository)
    }
    
    private func photoListDataSource() -> BothamTableViewDataSource<Photo, PhotoTableViewCell> {
        return BothamTableViewDataSource<Photo, PhotoTableViewCell>()
    }
    
    private func photoCollectionDataSource() -> BothamCollectionViewDataSource<Photo, PhotoCollectionViewCell> {
        return BothamCollectionViewDataSource<Photo, PhotoCollectionViewCell>()
    }
    
    // MARK: PhotoDetail
    
    func photoDetailViewController(photo: Photo) -> UIViewController {
        let photoDetailViewController: PhotoDetailViewController = storyBoard().instantiateViewController("PhotoDetailViewController")
        let presenter = photoDetailPresenter(photoDetailViewController, photo: photo)
        photoDetailViewController.presenter = presenter
        return photoDetailViewController
    }
    
    private func photoDetailPresenter(ui: PhotoDetailUI, photo: Photo) -> PhotoDetailPresenterImp {
        return PhotoDetailPresenterImp(ui: ui, photo: photo)
    }
    
}

