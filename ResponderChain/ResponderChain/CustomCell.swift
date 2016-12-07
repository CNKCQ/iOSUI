//
//  CustomCell.swift
//  ResponderChain
//
//  Created by KingCQ on 2016/12/7.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

// 利用事件响应链传值
// See: http://www.jianshu.com/p/ba555cc83cd3
// https://github.com/YueRuo/YRUISignal
class CustomCell: UITableViewCell {
    var button: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        button = UIButton(frame: CGRect(x: 20, y: 10, width: 44, height: 30))
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func click(sender: UIButton) {
        sender.routerWithEvent(name: "click", userInfo: ["hello" : "world"])
    }
}

extension UIResponder {
    
    func routerWithEvent(name: String, userInfo: [String: Any])  {
        if self.next != nil {
            self.next?.routerWithEvent(name: name, userInfo: userInfo)
        }
    }
}
