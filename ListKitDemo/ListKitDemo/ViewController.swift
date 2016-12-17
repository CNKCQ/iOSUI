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
                Item(title: "我的关注", subtitle: "wobuhao")
            ],
            [
                Item(title: "我的收藏", subtitle: "hello world"),
                Item(title: "最近浏览", subtitle: "")
            ],
            [
                Item(title: "我的书夹", dest: TableGroupDetail(), selectable: true)
            ]
        ]
    }
    
    
}

