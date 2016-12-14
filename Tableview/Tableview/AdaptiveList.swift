//
//  AdaptiveList.swift
//  Tableview
//
//  Created by KingCQ on 2016/12/14.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class AdaptiveList: BaseTableList {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = ["naiha", "naiha", "naiha", "naiha", "naiha", "naiha"]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
                
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func add() {
        print(tableView.indexPathsForSelectedRows?.count, "🌹")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
