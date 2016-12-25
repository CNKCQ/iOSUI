//: [Previous](@previous)

import Foundation

func mul(_ a: Int) -> (Int) -> Int {
    return {
        return a * $0
    }
}

func add(_ num: Int) -> (Int) -> Int {
    return {
        return num + $0
    }
}

add(2)(4)

mul(2)(4)
mul(4)(5)


func div(of a: Int) {
    print(a)
}

div(of: 5)

var car1 = "Benz"
let closure1 = { [car1] in
    print("I drive \(car1)")
}
car1 = "Tesla"
closure1()

var car = "Benz"
let closure = {
    print("I drive \(car)")
}
car = "Tesla"
closure()
//func print(_ values:Any...) {
//    print(values, "🌹")
//}

let con = true

public func log(_ items: Any..., separator: String = "", terminator: String = "") {
    if con {
        print(items)
    }
}
log("Hello", "🌹")

debugPrint("", 20)

class Food {
    class func ok(email: String) {
        
    }
}


