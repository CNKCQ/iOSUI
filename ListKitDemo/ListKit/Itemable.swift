//
//  Items.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

protocol Itemable: class {
    var title: String { set get }
    var subtitle: String { set get }
}
