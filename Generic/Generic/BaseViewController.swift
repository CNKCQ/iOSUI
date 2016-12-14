//
//  ViewController.swift
//  Generic
//
//  Created by KingCQ on 2016/12/5.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class BaseViewController: BaseController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    let datas = ["Generic Function", "Generic Class"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "test"
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        view.backgroundColor = UIColor.red
        view.addSubview(tableView)
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
        var dest: UIViewController?
        if datas[indexPath.row].contains("Function") {
            dest = GenericFunction()
        } else {
            dest = SubGenericClass()
        }
        navigationController?.pushViewController(dest!, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//    }

}

