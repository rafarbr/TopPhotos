//
//  PhotoCollectionViewCell.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import AlamofireImage

class PhotoCollectionViewCell: UICollectionViewCell, BothamViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    func configureForItem(item: Photo)  {

        let size: CGSize = CGSizeMake(50.0, 50.0)
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: radius)
        let placeholder = UIImage(named: "noimage")?.af_imageScaledToSize(size).af_imageWithRoundedCornerRadius(radius)

        if let image = item.photoUrl {
            if let url = NSURL(string: image) {
                photoImageView?.load(fromURL: url, placeholderImage: placeholder, filter: filter)
            }
        }
        photoTitleLabel?.text = item.title
    }
}
