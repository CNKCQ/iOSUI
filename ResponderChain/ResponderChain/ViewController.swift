//
//  ViewController.swift
//  ResponderChain
//
//  Created by KingCQ on 2016/12/7.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView!
    let names = ["", "", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
    }

    override func routerWithEvent(name: String, userInfo: [String : Any]) {
        if name == "click" {
            print(userInfo, "🌹")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

