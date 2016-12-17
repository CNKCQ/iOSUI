//
//  UIViewController.swift
//  ListKitDemo
//
//  Created by KingCQ on 2016/12/17.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

extension UIViewController {
    func startActivity(_ dest: UIViewController, animated: Bool = true) {
        dest.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(dest, animated: animated)
    }
}
