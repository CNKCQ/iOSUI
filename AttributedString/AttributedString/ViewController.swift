//
//  ViewController.swift
//  AttributedString
//
//  Created by KingCQ on 2016/12/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 60))
        label.font = UIFont.systemFont(ofSize: 48)
        view.addSubview(label)
        label.backgroundColor = UIColor.green
        let titleText = "你好  ▼"
        let attributedText = NSMutableAttributedString(string: titleText)
        let range = (titleText as NSString).range(of: "▼")
        attributedText.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSBaselineOffsetAttributeName: NSNumber(value: 20)], range: range)
        label.attributedText = attributedText

    }


}

