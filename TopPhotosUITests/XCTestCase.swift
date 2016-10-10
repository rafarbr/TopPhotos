//
//  XCTestCase.swift
//  TopPhotos
//
//  Created by PH on 06/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation
import KIF

extension XCTestCase {
    func tester(file: String = #file, line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file: String = #file, line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
