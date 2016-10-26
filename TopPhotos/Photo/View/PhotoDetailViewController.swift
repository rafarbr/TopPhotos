//
//  PhotoDetailViewController.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import BothamUI

class PhotoDetailViewController: BothamViewController, PhotoDetailUI {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoAlbumIdLabel: UILabel!
    @IBOutlet weak var photoIdLabel: UILabel!
    
    func showPhoto(photo: Photo) {
        let size: CGSize = CGSizeMake(93.0, 70.0)
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: radius)
        let placeholder = UIImage(named: "noimage")?.af_imageWithRoundedCornerRadius(radius)
        
        if let image = photo.photoUrl {
            if let url = NSURL(string: image) {
                photoImageView?.load(fromURL: url, placeholderImage: placeholder, filter: filter, imageTransition: .CrossDissolve(1.25))
            }
        }
    }
    
    func showPhotoInformation(photo: Photo) {        
        photoTitleLabel.text = photo.title
        photoAlbumIdLabel.text = "ID \(photo.id)"
        photoIdLabel.text = "Album Id \(photo.albumId)"

    }
    
}
