//
//  ViewController.swift
//  Generic
//
//  Created by KingCQ on 2016/12/13.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 10, y: 80, width: 120, height: 40))
        label.text = "text"
        label.backgroundColor = UIColor.blue
        view.addSubview(label)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            print(Thread.current, "\(Thread.current) -- 🌹我")
        }
        
        DispatchQueue(label: "hello").async  {
            self.label.frame = CGRect(x: 100, y: 200, width: 200, height: 40)
            self.label.backgroundColor = .orange
            print(Thread.current, "\(Thread.current) -- 🌹你")
        }

        print(Thread.current, "\(Thread.current) -- 🌹ta")
    }
}
