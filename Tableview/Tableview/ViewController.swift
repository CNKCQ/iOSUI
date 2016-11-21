//
//  ViewController.swift
//  Tableview
//
//  Created by KingCQ on 2016/11/21.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

enum MultiSelectedStyle {
    case `default`, checkmark
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    let data = ["naiha", "naiha", "naiha", "naiha", "naiha", "naiha"]
    
    var multiSelectedStyle = MultiSelectedStyle.checkmark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "mm://database/tags_tag/hell0?name=wang") {
            print(url.scheme ?? "", url.host, url.port ?? "", url.path, url.query, url.lastPathComponent, url.pathComponents, "🌹")
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.allowsMultipleSelection = true
        tableView.selectRow(at: IndexPath(row: 1, section: 0), animated: false, scrollPosition: .none)
        view.addSubview(tableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  String(describing: UITableViewCell.self))!
        print(cell.isSelected, "🌹")
        if cell.isSelected {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch multiSelectedStyle {
        case .checkmark:
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            cell?.selectionStyle = .none
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func add() {
        print(tableView.indexPathsForSelectedRows?.count, "🌹")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
