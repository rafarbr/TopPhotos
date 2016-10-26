//
//  PhotoCollectionViewController.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class PhotoCollectionViewController: BothamViewController, BothamLoadingViewController, BothamCollectionViewController, PhotoUI, ShowsAlert {
    
    let loadingView: UIView = {
        let loadingView = BothamLoadingView()
        loadingView.color = UIColor.loadingColor
        return loadingView
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyView: UILabel!
    
    var dataSource: BothamCollectionViewDataSource<Photo, PhotoCollectionViewCell>!
    var delegate: UICollectionViewDelegate?
    
    override func viewDidLoad() {
        title = "Top Photos"
        
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.accessibilityLabel = "PhotoCollectionView"
        
        emptyView.hidden = true
        
        super.viewDidLoad()
    }
    
    func showEmptyCase(error: NSError) {
        showAlert(message: error.localizedDescription) { (buttonPressed) in
            super.viewDidLoad()
        }
        emptyView.hidden = false
    }
    
    func openPhotoDetailScreen(photoDetailViewController: UIViewController) {
        photoDetailViewController.modalPresentationStyle = .Popover
        photoDetailViewController.preferredContentSize = CGSizeMake(CGRectGetWidth(view.bounds) / 2, 350)
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            photoDetailViewController.view.backgroundColor = UIColor.clearColor()
            let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.ExtraLight))
            blurView.frame = photoDetailViewController.view.bounds
            photoDetailViewController.view.insertSubview(blurView, atIndex: 0)
        }
        
        let popoverController = photoDetailViewController.popoverPresentationController
        popoverController?.backgroundColor = UIColor.clearColor()
        popoverController?.permittedArrowDirections = .Any
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRectMake(CGRectGetWidth(view.bounds) / 2, 0, 1, 1)
        
        presentViewController(photoDetailViewController, animated: true, completion: nil)
    }
}
