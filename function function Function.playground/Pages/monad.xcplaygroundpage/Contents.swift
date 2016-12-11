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

print("a,b*c&d".components(separatedBy: [",","*","&"]))


print(["4"].joined(separator: ","))

func test(object: AnyObject) {}

test(object: NSString())
test(object: NSArray())
test(object: barr as AnyObject)
test(object: a as AnyObject)
test(object: b as AnyObject)
test(object: ["nihao": "wohao"] as AnyObject)
