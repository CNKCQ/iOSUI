import Foundation

extension String {
    mutating func remove(after: String) -> String {
        if let range = self.range(of: after) {
            removeSubrange(range.lowerBound..<endIndex)
        }
        return self
    }
    
    mutating func substring(to string: String) -> String {
        return substring(to: (range(of: string)?.lowerBound) ?? endIndex)
    }
}

var string = "1234<user>"

print(string.remove(after: "<"), string.substring(to: "<"), string.components(separatedBy: "<").first!)
