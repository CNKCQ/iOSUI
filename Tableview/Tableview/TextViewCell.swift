//
//  TextViewCell.swift
//  Tableview
//
//  Created by KingCQ on 2016/11/29.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {
    var textView: UITextView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textView = UITextView(frame: bounds)
        contentView.addSubview(textView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
