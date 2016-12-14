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
        button.setBackgroundImage(UIImage.image(with: UIColor.red), for: .normal)
        button.setBackgroundImage(UIImage.image(with: UIColor.blue), for: .highlighted)
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

extension UIImage {
    /* 生成纯色图片, 默认大小1x1, 在UITableViewCell默认左侧图标使用时需要手动设定大小占位 */
    public class func image(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsBeginImageContext(size)
        color.set()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

}
