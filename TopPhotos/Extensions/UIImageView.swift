//
//  UIImageView.swift
//  TopPhotos
//
//  Created by PH on 07/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

public extension UIImageView {
    public func load(fromURL url: NSURL, placeholderImage: UIImage? = nil, filter: ImageFilter? = nil, imageTransition: ImageTransition = .None) {
        
        let activity: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activity.frame = self.bounds
        activity.hidesWhenStopped = true
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            self.addSubview(activity)
            self.bringSubviewToFront(activity)
            activity.startAnimating()
        })
        self.af_setImageWithURL(url, placeholderImage: placeholderImage, filter: filter, imageTransition: imageTransition) { (response) in
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                if response.result.isSuccess {
                    self.image = response.result.value
                }
                activity.stopAnimating()
                activity.removeFromSuperview()
            })
        }
    }
}
