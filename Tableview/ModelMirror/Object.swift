//
//  Object.swift
//  Tableview
//
//  Created by KingCQ on 2016/12/31.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Foundation

class Object: NSObject {
    
    var properties: [String: Any] {
        return dict(Mirror(reflecting: self))
    }

    override init() {}
    
    func convert(by dict: [String: Any]) -> Self {
        let model = self
        let mirror = Mirror(reflecting: model)
        print("对象类型", mirror.subjectType, "🌹")
        for (_, item) in mirror.children.enumerated() {
            if let label = item.label {
                model.setValue(dict[label], forKey: label)
            }
        }
        return model
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("🌹, 没有定义的属性 ,👌")
    }
}

extension Object {}

func dict(_ mirror: Mirror) -> [String: Any] {
    var dic: [String: Any] = [:]
    for (_, item) in mirror.children.enumerated() {
        if let key = item.label {
            dic[key] = item.value
        }
    }
    if let sup = mirror.superclassMirror {
        for (property, value) in dict(sup) {
            dic[property] = value
        }
    }
    return dic
}
