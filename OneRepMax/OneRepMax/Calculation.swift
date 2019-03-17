//
//  Calculation.swift
//  OneRepMax
//
//  Created by Mauro Garcia on 14/01/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import Foundation
import CoreData

struct Calculator {
    let weight: Double
    let reps: Double
    
    init(weight: String, reps: String) {
        self.weight = Double(weight) ?? 0.0
        self.reps = Double(reps) ?? 0.0
    }
    
    func calcRM() -> Double {
        if reps == 1 {
            return weight
        } else {
        let repMaxNumber = weight * reps * 0.0333 + weight
        let roundedRepMaxNumber = repMaxNumber.rounded()
        return roundedRepMaxNumber
        
    }
 }
}

















