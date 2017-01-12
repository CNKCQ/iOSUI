//: Playground - noun: a place where people can play

import UIKit


extension Array {
    func map<T>(_ transform: (Element)  -> T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(transform(x))
        }
       return result
    }
}


func genericArray<Eelement, T>(xs: [Eelement], transform: (Eelement) -> T) -> [T] {
    return xs.map(transform)
}

func incrementArray(xs: [Int]) -> [Int] {
    return genericArray(xs: xs, transform: {
        return $0 + 2
    })
}

incrementArray(xs: [0,1])

func doubleArray1(xs: [Int]) -> [Int] {
    return genericArray(xs: xs, transform: {
        return $0 * 2
    })
}

// swap two elements'values
func swap<E>( a: inout E, b: inout E) {
    let temp = a
    b = a
    a = temp
}

// find value from array
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (idx, value) in array.enumerated() {
        if value == valueToFind {
            return idx
        }
    }
    return nil
}

func min<T: Comparable>(x: T, y: T) -> T {
    return x < y ? x : y
}

min(4, 1)

var testa = ["1", "2", "3", "4"]

let idx = testa.index { e -> Bool in
    return e == "4"
}

func reverse(_ arr: inout [String]) -> [String] {
    var s = arr.startIndex
    var e = arr.endIndex - 1
    while s < e {
        let t = arr[e]
        arr[e] = arr[s]
        arr[s] = t
        s += s
        e -= e
    }
    return arr
}


//print(testa.reversed() as [String])
print(reverse(&testa))
doubleArray1(xs: [0, 1, 2])
