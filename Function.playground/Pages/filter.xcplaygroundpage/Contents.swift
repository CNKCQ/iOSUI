//: [Previous](@previous)

import Foundation

let exampleFiles = ["README.md", "HelloWorld.swift", "FlappyBird.swift"]

extension Array {
    func filter(_ isIncluded: (Element)  -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where isIncluded(x) {
            result.append(x)
        }
        return result
    }
}

func getSwiftFiles(files: [String ]) -> [String] {
    return files.filter { file in file.hasSuffix(".swift")}
}

getSwiftFiles(files: exampleFiles)