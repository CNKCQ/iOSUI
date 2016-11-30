//
//  TextViewCell.swift
//  Tableview
//
//  Created by KingCQ on 2016/11/29.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import SnapKit
import SZTextView

class TextViewCell: UITableViewCell, UITextViewDelegate {
    var textView: SZTextView!
    var tableVeiw: UITableView {
        return self.superview?.superview as! UITableView
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textView = SZTextView(frame: bounds)
        contentView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        textView.placeholder = "请输入内容！"
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.isScrollEnabled = false
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        var bounds = textView.bounds
        let maxSize = CGSize(width: bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        let newSize = textView.sizeThatFits(maxSize)
        bounds.size = newSize
        tableVeiw.beginUpdates()
        tableVeiw.endUpdates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
