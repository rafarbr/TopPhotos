//
//  PhotoDetailPresenter.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import BothamUI

protocol PhotoDetailPresenter: BothamPresenter {
    
}

class PhotoDetailPresenterImp: PhotoDetailPresenter {
    // UserInterface
    private weak var ui: PhotoDetailUI?
    
    // Photo data
    private let photo: Photo
    
    init(ui: PhotoDetailUI, photo: Photo) {
        self.ui = ui
        self.photo = photo
    }
    
    func viewDidLoad() {
        ui?.title = "ID: \(photo.id)"
        self.ui?.showPhotoInformation(photo)
    }
    
    func viewDidAppear() {
        self.ui?.showPhoto(photo)
    }
}

protocol PhotoDetailUI: BothamUI {
    // Title of view
    var title: String? {get set}
    
    // Show photo information
    func showPhoto(photo: Photo)
    func showPhotoInformation(photo: Photo)
}
