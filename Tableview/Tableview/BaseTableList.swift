//
//  BaseTableList.swift
//  Tableview
//
//  Created by KingCQ on 2016/12/14.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class BaseTableList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var data: [Any] = []
    private var name = "nihao"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextViewCell.self, forCellReuseIdentifier: String(describing: TextViewCell.self))
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  String(describing: TextViewCell.self))!
        return cell
    }
    
}

class test: BaseTableList {
    override func viewDidLoad() {
        super.viewDidLoad()
        let p = User().convert(by: dict)
        print(p.name, "🌹", p.age)
        print(p.properties)
    }
}

class Person: Object {
    var name = ""
    var age = 0
    var user: User? = nil
    
    required override init() {}
}

class User: Person {
    var phone = ""
}

let dict: [String: Any] = ["name": "xiaohong", "age": 20, "phone": "15201866594"]
