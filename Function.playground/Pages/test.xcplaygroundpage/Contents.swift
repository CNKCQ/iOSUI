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

var car3 = "Benz"
let closure3 = {
    car3 = "Tesla"
}
closure3()
print(car3)

func print(_ values:Any...) {
    print(values, "🌹")
}


let isOk = false

if isOk {
    print("isOk")
}



