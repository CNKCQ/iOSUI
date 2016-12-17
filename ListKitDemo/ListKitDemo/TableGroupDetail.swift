//
//  TableGroupDetail.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/17.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class TableGroupDetail: GroupDatil {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            [
                Item(title: "安全设置"),
                Item(title: "意见与反馈")
            ],
            [
                Item(title: "关于"),
                Item(title: "版本")
            ]
        ]
    }
    
}
