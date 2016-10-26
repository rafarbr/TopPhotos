//
//  ShowsAlert.swift
//  TopPhotos
//
//  Created by PH on 09/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import UIKit

protocol ShowsAlert {}

extension ShowsAlert where Self: UIViewController {
    func showAlert(title: String = "Error", message: String, completion: ((buttonPressed: String) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.accessibilityLabel = message
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: {
            (action : UIAlertAction) -> Void in
            if let msg = action.title {
                completion?(buttonPressed: msg)
            }
        })
        okAction.accessibilityLabel = "OK"
        alertController.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        cancelAction.accessibilityLabel = "CANCEL"
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}
