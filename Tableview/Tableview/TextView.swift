//
//  TextView.swift
//  Tableview
//
//  Created by KingCQ on 2016/11/29.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

protocol TextViewDelegate {
    func textViewDidChange(_ textView: UITextView)
}

class TextView: UITextView, UITextViewDelegate {

    var placeholder: String = "" {
        didSet {
            placeholderTextView.text = placeholder
        }
    }
    var fadeTime: Double = 0
    var attributedPlaceholder: NSAttributedString = NSAttributedString(string: "")
    var placeholderTextColor: UIColor = UIColor.darkGray
    var placeholderTextView: UITextView = UITextView()
    var textDelegate: TextViewDelegate?
    
    
    let attributedPlaceholderKey = "attributedPlaceholder"
    let placeholderKey = "placeholder"
    let fontKey = "font"
    let attributedTextKey = "attributedText"
    let textKey = "text"
    let exclusionPathsKey = "exclusionPaths"
    let lineFragmentPaddingKey = "lineFragmentPadding"
    let textContainerInsetKey = "textContainerInset"
    let textAlignmentKey = "textAlignment"

    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        preparePlaceholder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func preparePlaceholder()  {
        let frame = self.bounds
        placeholderTextView.frame = frame
        placeholderTextView.isOpaque = false
        placeholderTextView.backgroundColor = UIColor.clear
        placeholderTextView.textColor = UIColor(white: 0.7, alpha: 0.7)
        placeholderTextView.textAlignment = self.textAlignment
        placeholderTextView.isEditable = false
        placeholderTextView.isScrollEnabled = false
        placeholderTextView.isUserInteractionEnabled = false
        placeholderTextView.font = self.font
        placeholderTextView.isAccessibilityElement = false
        placeholderTextView.contentOffset = self.contentOffset
        placeholderTextView.contentInset = self.contentInset
        placeholderTextView.isSelectable = false
        if self.responds(to: #selector(getter: textContainer)) {
            placeholderTextView.textContainer.exclusionPaths = self.textContainer.exclusionPaths
            placeholderTextView.textContainer.lineFragmentPadding = self.textContainer.lineFragmentPadding
        }
        if self.responds(to: #selector(getter: textContainerInset)) {
            placeholderTextView.textContainerInset = self.textContainerInset
        }
        if attributedPlaceholder.length > 0 {
            placeholderTextView.attributedText = attributedPlaceholder
        } else if !placeholder.isEmpty {
            placeholderTextView.text = placeholder
        }
        setPlaceholderVisibleForText(text: self.text)
        self.clipsToBounds = true
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(textViewDidChange(_:)), name: NSNotification.Name.UITextViewTextDidChange, object: self)
        self.addObserver(self, forKeyPath: attributedPlaceholderKey, options: .new, context: nil)
        self.addObserver(self, forKeyPath: placeholderKey, options: .new, context: nil)
        self.addObserver(self, forKeyPath: fontKey, options: .new, context: nil)
        self.addObserver(self, forKeyPath: attributedTextKey, options: .new, context: nil)
        self.addObserver(self, forKeyPath: textKey, options: .new, context: nil)
        self.addObserver(self, forKeyPath: textAlignmentKey, options: .new, context: nil)
        
        if self.responds(to: #selector(getter: textContainer)) {
            self.textContainer.addObserver(self, forKeyPath: exclusionPathsKey, options: .new, context: nil)
            self.textContainer.addObserver(self, forKeyPath: lineFragmentPaddingKey, options: .new, context: nil)
        }
        
        if self.responds(to: #selector(getter: textContainerInset)) {
            self.addObserver(self, forKeyPath: textContainerInsetKey, options: .new, context: nil)
        }
    }
    
    func setPlaceholder(text: String)  {
        placeholder = text
        attributedPlaceholder = NSAttributedString(string: text)
        resizePlaceholderFrame()
        
    }
    
    func setAttributedPlaceholder(text: NSAttributedString) {
        placeholder = text.string
        attributedPlaceholder = text
        resizePlaceholderFrame()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resizePlaceholderFrame()
    }
    
    func setPlaceholderVisibleForText(text: String) {
        if text.isEmpty {
            if self.fadeTime > 0.0 {
                if !self.placeholderTextView.isDescendant(of: self) {
                    self.placeholderTextView.alpha = 0
                    addSubview(placeholderTextView)
                    UIView.animate(withDuration: fadeTime, animations: { 
                        self.placeholderTextView.alpha = 1
                    })
                }
            } else {
                self.addSubview(placeholderTextView)
                self.sendSubview(toBack: placeholderTextView)
                placeholderTextView.alpha = 1
            }
        } else {
            if fadeTime > 0 {
                UIView.animate(withDuration: fadeTime, animations: {
                        self.placeholderTextView.alpha = 0
                })
            } else {
                placeholderTextView.removeFromSuperview()
            }
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setPlaceholderVisibleForText(text: self.text)
        if textDelegate != nil {
            textDelegate?.textViewDidChange(textView)
        }
    }
    
    func resizePlaceholderFrame() {
        var frame = placeholderTextView.frame
        frame.size = bounds.size
        placeholderTextView.frame = frame
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath ?? "" {
        case attributedPlaceholderKey:
            placeholderTextView.attributedText = change?[NSKeyValueChangeKey.newKey] as! NSAttributedString
        case placeholderKey:
            placeholderTextView.text = change?[NSKeyValueChangeKey.newKey] as! String
        case fontKey:
            placeholderTextView.font = change?[NSKeyValueChangeKey.newKey] as? UIFont
        case attributedTextKey:
            setPlaceholderVisibleForText(text: (change?[NSKeyValueChangeKey.newKey] as! NSAttributedString).string)
        case textKey:
            setPlaceholderVisibleForText(text: change?[NSKeyValueChangeKey.newKey] as! String)
        case exclusionPathsKey:
            placeholderTextView.textContainer.exclusionPaths = change?[NSKeyValueChangeKey.newKey] as! [UIBezierPath]
            resizePlaceholderFrame()
        case lineFragmentPaddingKey:
            placeholderTextView.textContainer.lineFragmentPadding = change?[NSKeyValueChangeKey.newKey] as! CGFloat
            resizePlaceholderFrame()
        case textContainerInsetKey:
            placeholderTextView.textContainerInset = change?[NSKeyValueChangeKey.newKey] as! UIEdgeInsets
            resizePlaceholderFrame()
        case textAlignmentKey:
            placeholderTextView.textAlignment = NSTextAlignment(rawValue: change?[NSKeyValueChangeKey.newKey] as! Int)!
            resizePlaceholderFrame()

        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        setPlaceholderVisibleForText(text: self.text)
        return super.becomeFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        self.removeObserver(self, forKeyPath: attributedPlaceholderKey)
        self.removeObserver(self, forKeyPath: placeholderKey)
        self.removeObserver(self, forKeyPath: fontKey)
        self.removeObserver(self, forKeyPath: attributedTextKey)
        self.removeObserver(self, forKeyPath: textKey)
        self.removeObserver(self, forKeyPath: textAlignmentKey)
        if self.responds(to: #selector(getter: textContainer)) {
            self.removeObserver(self, forKeyPath: exclusionPathsKey)
            self.removeObserver(self, forKeyPath: lineFragmentPaddingKey)
        }
        if self.responds(to: #selector(getter: textContainerInset)) {
            self.removeObserver(self, forKeyPath: textContainerInsetKey)
        }
    }
    
}
