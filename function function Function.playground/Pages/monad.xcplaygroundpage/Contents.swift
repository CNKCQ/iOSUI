//: [Previous](@previous)

import Foundation

let array = [1, 2, 3, 4]

let brray = array.map({"NO." + String($0)})

print(brray)

let barr = [[1,2,3], ["4","5","6"]].flatMap({$0})

print(barr)

let ba = array.map({$0 * 2}).map { "this is \($0)"}.map({$0.uppercased()})

print(ba)

let a:Int? = 2
let b: String? = "this is"

print(a.map({$0 * 2}))

print(b.map({$0 + " good"}))

print(a.flatMap({$0 * 2}))
