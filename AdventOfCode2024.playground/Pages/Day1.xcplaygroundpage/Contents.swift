import Foundation

let startTime = CFAbsoluteTimeGetCurrent()

let fileURL = Bundle.main.url(forResource: "Day1Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)


let lines = content.split(separator: "\n")
var listA: [Int] = []
var listB: [Int] = []

lines.forEach { value in
    let values = value.split(separator: " ")
    listA.append(Int(values[0])!)
    listB.append(Int(values[1])!)
}

let output = zip(listA.sorted(), listB.sorted()).map { (intA, intB) -> Int in
    return abs(intA - intB)
}.reduce(0, +)

let endTime = CFAbsoluteTimeGetCurrent()
print(output)
print(endTime-startTime)




