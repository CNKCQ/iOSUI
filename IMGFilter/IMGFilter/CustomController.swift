//
//  CustomController.swift
//  IMGFilter
//
//  Created by KingCQ on 2017/1/12.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class CustomController: UIViewController, UITextFieldDelegate {
    
    var imageView: UIImageView!
    var fields: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: view.bounds.width, height: view.bounds.height * 0.75)))
        view.addSubview(imageView)
        imageView.image = UIImage(named: "img.jpg")
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        let screen = UIScreen.main.bounds
        let padding: CGFloat = 10
        let width = screen.width / 5 - padding
        for i in 0..<20 {
            let textField = UITextField (frame: CGRect(x: (width + padding) * CGFloat(i % 5) + 5, y: CGFloat((i / 5) * (30 + 10) + 10) + imageView.frame.maxY, width: width, height: 30))
            textField.tag = i
            textField.delegate = self
            textField.borderStyle = .roundedRect
            view.addSubview(textField)
            fields.append(textField)
        }
    }
    
    func refresh() {
        let filter = FilterManager()
        var array = Array(repeating: "0", count: 20)
        array = fields.flatMap { $0.text ?? "0"}
        print(array, "🐂")
        imageView.image = filter.show(UIImage(named: "img.jpg")!, with: array)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.tag, "🌹")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        refresh()
    }

}
