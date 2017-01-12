//
//  GenericClass.swift
//  Generic
//
//  Created by KingCQ on 2016/12/5.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class GenericClass<T: Rice>: BaseGenericClass<T>, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var datas = ["1", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }
    
    override func dropped(food: T) {
        super.dropped(food: food)
        print("\(food.name) 能吃吗？\(food.eatable)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//    }
}

/* 泛型总结：
类型参数可以看做是真实类型的占位符，当泛型或者函数被使用时才会被真实类型替换。
 优点：
 减少冗余代码
 提供的接口灵活
 类型安全
*/

protocol genericable {
}

extension genericable where Self: GenericClass<Rice> {
    
}


