//
//  PhotoPresenter.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

protocol PhotoPresenter: BothamPresenter, BothamNavigationPresenter {
    
}

class PhotoPresenterImp: PhotoPresenter {
    
    // UserInterface
    private weak var ui: PhotoUI?
    
    // Repository
    private let repository: PhotoRepository
    
    init(ui: PhotoUI, repository: PhotoRepository) {
        self.ui = ui
        self.repository = repository
    }
    
    func viewDidLoad() {
        ui?.showLoader()
        repository.getAll { (resultPhoto) in
            self.ui?.hideLoader()
            switch resultPhoto {
            case .Success(let photos):
                self.ui?.showItems(photos)
            case .Failure(let error):
                self.ui?.showEmptyCase(error)
            }
        }
    }
    
    func itemWasTapped(item: Photo) {
        let photoDetailViewController = ServiceLocator().photoDetailViewController(item)
        ui?.openPhotoDetailScreen(photoDetailViewController)
    }
    
}

protocol PhotoUI: BothamUI, BothamLoadingUI {
    func showEmptyCase(error: NSError)
    func showItems(items: [Photo])
    func openPhotoDetailScreen(photoDetailViewController: UIViewController)
}
