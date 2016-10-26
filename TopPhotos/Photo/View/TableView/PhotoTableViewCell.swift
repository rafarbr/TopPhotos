//
//  PhotoTableViewCell.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import AlamofireImage

class PhotoTableViewCell: UITableViewCell, BothamViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.clearColor().CGColor
    }
    
    func configureForItem(item: Photo) {
        let placeholder = UIImage(named: "noimage")
        
        if let image = item.thumbnailUrl {
            if let url = NSURL(string: image) {
                thumbnailImageView?.load(fromURL: url, placeholderImage: placeholder)
            }
        } 
        
        titleLabel.text = item.title
        albumIdLabel.text = "Album: \(item.albumId)"
        idLabel.text = "Identifier \(item.id)"
        
        accessibilityLabel = "\(item.id)-Identifier"

    }
    
}
