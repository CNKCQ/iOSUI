//: [Previous](@previous)

import Foundation

func mul(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int {
        return a * b
    }
    return innerMul
}

mul(2)(3)

func div(of a: Int) {
    print(a)
}

div(of: 5)