//
//  SubGenericClass.swift
//  Generic
//
//  Created by KingCQ on 2016/12/6.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class SubGenericClass: GenericClass<Porridge> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropped(food: Porridge())
    }
    
    override func dropped(food: Porridge) {
        super.dropped(food: food)
        print("能喝吗？\(food.drinkable)")
    }
    
}
