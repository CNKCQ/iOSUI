//
//  GenericFunction.swift
//  Generic
//
//  Created by KingCQ on 2016/12/5.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

class GenericFunction: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eat(food: Rice())
    }
    
    func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
        for (idx, value) in array.enumerated() {
            if value == valueToFind {
                return idx
            }
        }
        return nil
    }
    override func eat<T : Rice>(food: T) {
        
    }
    func swap<T>(a: inout T, b: inout T) {
        (a, b) = (b, a)
    }
}

struct Bread<T> {
    let city: T
}
