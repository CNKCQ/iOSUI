//
//  GenericClass.swift
//  Generic
//
//  Created by KingCQ on 2016/12/5.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

class GenericClass<T: Rice>: BaseGenericClass<T> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func dropped(food: T) {
        super.dropped(food: food)
        print("\(food.name) 能吃吗？\(food.eatable)")
    }
    
}

/* 泛型总结：
类型参数可以看做是真实类型的占位符，当泛型或者函数被使用时才会被真实类型替换。
 
 优点：
 减少冗余代码
 提供的接口灵活
 类型安全
*/
