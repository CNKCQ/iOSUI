//
//  ViewController.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: GroupDatil {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            [
                Item(title: "nihao", subtitle: "wobuhao")
            ],
            [
                Item(title: "hello", subtitle: "hello world"),
                Item(title: "题目", subtitle: "yes"),
            ],
            [
                Item(title: "go", subtitle: "where you want to go", dest: TableGroupDetail())
            ]
        ]
    }
}

