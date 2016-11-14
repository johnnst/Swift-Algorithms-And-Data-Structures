//
// John Ngoi
// Swift 3
// TwoSum problem
// Given an array of numbers (at least 2), find the two number pairs that equal to a given sum.
// For example.
// [2, 6, 9, 5, 10, -7]
// The pair for a sum of 15 is [9, 6]
//

func twoSum (numbers: [Int], sum: Int) -> [Int]? {
    if numbers.count < 2 {
        return nil
    }
    
    var dict = [Int: Int]()
    for num in numbers {
        let complement = sum - num
        if let other = dict[complement] {
            return [num, other]
        } else {
            dict[num] = num
        }
    }
    return nil
}

let numbers = [2, 6, 9, 5, 10, -7]
let sum = twoSum(numbers: numbers, sum: 15)
let sum2 = twoSum(numbers: numbers, sum: 1)
let sum3 = twoSum(numbers: numbers, sum: 2)
