//
//  PhotoListViewController.swift
//  TopPhotos
//
//  Created by PH on 04/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import BothamUI

class PhotoListViewController: BothamViewController, BothamLoadingViewController, BothamTableViewController, PhotoUI, ShowsAlert {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UILabel!
    
    var dataSource: BothamTableViewDataSource<Photo, PhotoTableViewCell>!
    var delegate: UITableViewDelegate?

    let loadingView: UIView = {
        let loadingView = BothamLoadingView()
        loadingView.color = UIColor.loadingColor
        return loadingView
    }()
        
    override func viewDidLoad() {
        title = "Top Photos"
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.tableFooterView = UIView()
        tableView.accessibilityLabel = "PhotoListTableView"
        
        emptyView.hidden = true
        
        configureNavigationBarBackButton()
        
        super.viewDidLoad()
    }
    
    func showEmptyCase(error: NSError) {
        showAlert(message: error.localizedDescription) { (buttonPressed) in
            super.viewDidLoad()
        }
        emptyView.hidden = false
    }
    
    func openPhotoDetailScreen(photoDetailViewController: UIViewController)  {
        navigationController?.push(photoDetailViewController)
    }
    
    private func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
    }
    
}
