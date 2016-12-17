//
//  Tablist.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/17.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class TableList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var datas: [[Item]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: CustomCell.self)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CustomCell.self)
        cell.textLabel?.text = datas[indexPath.section][indexPath.row].title
        return cell
    }
}
