//
//  BaseViewController.swift
//  Generic
//
//  Created by KingCQ on 2016/12/5.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    func eat<T: Food>(food: T) {
        print("能吃吗？\(food.eatable)")
    }
    
}



