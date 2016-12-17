//
//  GroupDatil.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/17.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class GroupDatil: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var items: [[Item]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: CustomCell.self)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CustomCell.self)
        cell.textLabel?.text = items[indexPath.section][indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.section][indexPath.row].subtitle
        cell.accessoryType = items[indexPath.section][indexPath.row].selectable ? .disclosureIndicator : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dest = items[indexPath.section][indexPath.row].dest else {
            return
        }
        startActivity(dest)
    }
}
