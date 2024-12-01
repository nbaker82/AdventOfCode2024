import Foundation

let startTime = CFAbsoluteTimeGetCurrent()

let fileURL = Bundle.main.url(forResource: "Day1Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

func getTotalDistance(_ content: String) -> Int {
    let lines = content.split(separator: "\n")
    var listA: [Int] = []
    var listB: [Int] = []

    lines.forEach { value in
        let values = value.split(separator: " ")
        listA.append(Int(values[0])!)
        listB.append(Int(values[1])!)
    }

    return zip(listA.sorted(), listB.sorted()).map { (intA, intB) -> Int in
        return abs(intA - intB)
    }.reduce(0, +)
}


let endTime = CFAbsoluteTimeGetCurrent()
print(getTotalDistance(content))
print(endTime-startTime)





func findSimilar(_ content: String) -> Int {
    let lines = content.split(separator: "\n")
    var listA: [Int] = []
    var listB: [Int] = []

    lines.forEach { value in
        let values = value.split(separator: " ")
        listA.append(Int(values[0])!)
        listB.append(Int(values[1])!)
    }
    var duplicateValues: [Int] = []
    let lastValueOfListB = listB.last
    var countDuplicateValue = 0
    
    listA.forEach { valueA in
        listB.forEach { valueB in
            if valueA == valueB {
                countDuplicateValue += 1
            }
            
            if lastValueOfListB == valueB {
                duplicateValues.append(countDuplicateValue * valueA)
                countDuplicateValue = 0
            }
        }
    }
    
    print(duplicateValues)
    return duplicateValues.reduce(0, +)
}

print(findSimilar(content))
