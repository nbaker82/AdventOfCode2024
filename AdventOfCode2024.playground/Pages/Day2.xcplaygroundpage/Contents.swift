
import Foundation

let fileURL = Bundle.main.url(forResource: "Day2", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

func isDecreasing(_ array: [Int]) -> Bool {
    return (1..<array.count).allSatisfy { array[$0] > array[$0 - 1] }
}

func isInreasing(_ array: [Int]) -> Bool {
    return (1..<array.count).allSatisfy { array[$0] < array[$0 - 1] }
}

func isOrderCorrect(_ array: [Int]) -> Bool {
    guard isInreasing(array) || isDecreasing(array) else { return false }
    return true
}

let lines = content
    .split(separator: "\n")
    .compactMap { substring -> [Int] in
        var newArray: [Int] = []
        let rowValues = substring.split(separator: " ")
        rowValues.forEach { value in
            newArray.append(Int(value)!)
        }
        return newArray
    }.compactMap { array -> [Bool]? in
        guard isOrderCorrect(array) else { return nil }

        let boolArray = zip(array, array.dropFirst()).map { current, next in
            let diff = current - next
            return abs(diff) < 4
        }
        
        print(array)
        print(boolArray)
        return boolArray
    }
    .compactMap { boolArray in
        boolArray.allSatisfy { $0 } ? true : nil
    }

print(lines.count)

