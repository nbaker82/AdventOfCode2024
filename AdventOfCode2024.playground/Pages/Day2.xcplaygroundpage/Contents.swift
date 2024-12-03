
import Foundation

let fileURL = Bundle.main.url(forResource: "Day2", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

func isDecreasing(_ array: [Int]) -> Bool {
    return (1..<array.count).allSatisfy {
        array[$0] > array[$0 - 1]
    }
}
func compareWithTwoAhead(_ array: [Int]) -> Bool {

    return (0..<array.count - 2).map { index in
        array[index] > array[index + 2]
    }.allSatisfy { value in
        value == true
    }
}

func compareWithTwoAheadLessThan(_ array: [Int]) -> Bool {

    return (0..<array.count - 2).map { index in
        array[index] < array[index + 2]
    }.allSatisfy { value in
        value == true
    }
    
}

func isInreasing(_ array: [Int]) -> Bool {
    return (1..<array.count).allSatisfy { array[$0] < array[$0 - 1] }
}

func isOrderCorrect(_ array: [Int]) -> Bool {
    guard isInreasing(array) || isDecreasing(array) else {
        return false
    }
    return true
}

//Part 1
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
        return boolArray
    }
    .compactMap { boolArray in
        boolArray.allSatisfy { $0 } ? true : nil
    }

print(lines.count)

// Part 2
let part2 = content
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
            if  abs(diff) < 4 {
                return true
            } else {
                return abs(current - next + 1) < 4
            }
        }
        return boolArray
    }
    .compactMap { boolArray in
        boolArray.allSatisfy { $0 } ? true : nil
    }
print(part2.count)
