//
//  Result.swift
//  TopPhotos
//
//  Created by PH on 09/10/16.
//  Copyright © 2016 Raphael Rosa. All rights reserved.
//

import Foundation

enum Result<T, E: ErrorType> {
    case Success(T)
    case Failure(E)
}
