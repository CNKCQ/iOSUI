//
//  BaseGenericClass.swift
//  Generic
//
//  Created by KingCQ on 2016/12/5.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

class BaseGenericClass<T: Food>: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func dropped(food: T) {
        print("\(food.nick) 可以🌹")
    }
    

}
