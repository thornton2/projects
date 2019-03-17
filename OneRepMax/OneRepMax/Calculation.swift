//
//  Calculation.swift
//  OneRepMax
//
//  Created by Mauro Garcia on 14/01/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import Foundation
import CoreData

class Calculator {
    var weight = 0.0
    var reps = 0
    
    var oneRepMax: Double {
        return reps == 0 ? 0.0 : weight * Double(reps) * 0.0333 + weight
    }
}
















