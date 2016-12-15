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

doubleArray1(xs: [0, 1, 2])
