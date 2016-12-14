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
        print(tableView.delegate, "bbb")
        dropped(food: Porridge())
    }
    
    override func dropped(food: Porridge) {
        super.dropped(food: food)
        print("能喝吗？\(food.drinkable)")
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//    }
//    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
//        return tableView.frame.height / 3
//    }
    
    @objc(tableView:heightForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc(tableView:commitEditingStyle:forRowAtIndexPath:)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
}
