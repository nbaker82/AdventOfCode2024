
import Foundation

let fileURL = Bundle.main.url(forResource: "Day3Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let pattern = #"mul\((\d+),(\d+)\)"#


func findValues(_ string: String) -> Int? {
    if let regex = try? Regex(pattern) {
        let matches = string.matches(of: regex)
       
        return matches.map { match in
            
            let int1 = Int(string[match.output[1].range!])!
            let int2 = Int(string[match.output[2].range!])!
            
            return (int1 * int2)
        }
        .compactMap{ $0 }
        .reduce(0, +)
        
    }
    return nil
}


print(findValues(content))


