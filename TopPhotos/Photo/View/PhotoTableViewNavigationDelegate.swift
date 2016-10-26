//
//  PhotoTableViewNavigationDelegate.swift
//  TopPhotos
//
//  Created by PH on 06/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import BothamUI
import UIKit

public class PhotoTableViewNavigationDelegate<T: BothamViewDataSource, U: BothamNavigationPresenter where T.ItemType == U.ItemType>: NSObject, UITableViewDelegate {
    private let dataSource: T
    private let presenter: U
    
    public init(dataSource: T, presenter: U) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.itemAtIndexPath(indexPath)
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.95, 0.95)
            UIView.transitionWithView(cell, duration: 0.1, options: .CurveLinear, animations: {
                cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
            }) { (finished) in
                self.presenter.itemWasTapped(item)
            }
        }
    }
}

