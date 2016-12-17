//
//  Group.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/17.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

class Group {
    var headerTitle = ""
    var items: [Item] = []
    var footerTitle = ""
    
    init(headerTitle: String = "", items: [Item] = [], footerTitle: String = "") {
        self.headerTitle = headerTitle
        self.items = items
        self.footerTitle = footerTitle
    }
}
