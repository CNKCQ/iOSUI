//: [Previous](@previous)

import Foundation
import UIKit

struct animal {
    
}

class Person: NSObject {
    var name = ""
    var age = 0
    
    required override init() {}
}

//let xiaoming = Person(name: "小明", age: 10)
//let re = Mirror(reflecting: xiaoming)
//print(re.children.count)


//for (i, item) in re.children.enumerated() {
//    if let name = item.label, name == "name" {
//        print(item.value)
//        
//    }
//    if let key = item.label {
//        print(dict[key]) 
//    }
//}


extension Dictionary {
    func convert<D: Person>(to: D) -> D {
        let model = D.init()
        let mirror = Mirror(reflecting: model)
        for (_, item) in mirror.children.enumerated() {
            if let key = item.label {
                model.setValue([key], forKey: key)
            }
        }
        return model
    }
}

let dict: [String: Any] = ["name": "xiaohong", "age": 20]
