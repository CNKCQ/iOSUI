//: [Previous](@previous)

import Foundation


func sum(xs: [Int]) -> Int {
    var result: Int = 0
    for x in xs {
        result = result + x
    }
    return result
}

sum(xs: [0, 1, 2, 3, 4, 5])

extension Array {
    func reduce<T>(initial: T, combine: (T, Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
}

func flatten<T>(xss: [[T]]) -> [T] {
    var result: [T] = []
    for xs in xss {
        result += xs
    }
    return result
}

flatten(xss: [[1,2], [3,4]])

struct City {
    let name: String
    let population: Int
}
let paris = City(name: "Paris", population: 2241)
let madrid = City(name: "Madrid", population: 3165)
let amsterdam = City(name: "Amsterdam", population: 827)
let berlin = City(name: "Berlin", population: 3562)
let cities = [paris, madrid, amsterdam, berlin]

extension City {
    func cityByScalingPopulation() -> City {
        return City(name: name, population: population * 1000)
    }
}

let cts = cities.filter{$0.population > 1000}.map{$0.cityByScalingPopulation()}.reduce("City: Population") { result, city in
    return result + "\(city.name): \(city.population)"
}

print(cts)

func noOp<T>(x: T) -> T {
    return x
}

func noOpAny(x: Any) -> Any {
    return x
}

func noOpAnyWrong(x: Any) -> Any {
    return 0
}

infix operator >>> { associativity left }


