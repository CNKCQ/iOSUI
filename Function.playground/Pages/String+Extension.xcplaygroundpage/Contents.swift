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
    
    func trimmed(set: CharacterSet = .whitespaces) -> String {
        return trimmingCharacters(in: set)
    }
    
    subscript (i: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: i)])
    }
    
    subscript (r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy: r.upperBound)
        
        return self[start...end]
    }

}


var string = "1234<user>"

string[2]

string[1..<2]
//
//print(string.remove(after: "<"), string.substring(to: "<"), string.components(separatedBy: "<").first!)


