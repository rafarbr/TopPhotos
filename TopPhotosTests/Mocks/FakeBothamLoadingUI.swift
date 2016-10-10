//
//  FakeBothamLoadingUI.swift
//  TopPhotos
//
//  Created by PH on 05/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import BothamUI

protocol FakeBothamLoadingUI: BothamLoadingUI {
    var loaderWasShowed: Bool { get set }
    var loaderWasHided: Bool { get set }
}

extension FakeBothamLoadingUI {
    func showLoader() {
        loaderWasShowed = true
    }
    
    func hideLoader() {
        loaderWasHided = true
    }
}
