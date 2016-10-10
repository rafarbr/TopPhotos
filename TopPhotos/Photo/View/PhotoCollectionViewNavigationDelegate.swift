//
//  PhotoCollectionViewNavigationDelegate.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import BothamUI
import UIKit

public class PhotoCollectionViewNavigationDelegate<T: BothamViewDataSource, U: BothamNavigationPresenter where T.ItemType == U.ItemType>: NSObject, UICollectionViewDelegate {
    private let dataSource: T
    private let presenter: U
    
    public init(dataSource: T, presenter: U) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.itemAtIndexPath(indexPath)
        presenter.itemWasTapped(item)
    }
}
