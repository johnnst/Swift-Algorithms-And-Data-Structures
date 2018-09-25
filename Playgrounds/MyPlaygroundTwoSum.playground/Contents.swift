// John Ngoi
// TwoSum problem
// Given an array of numbers (at least 2), find the two number pairs that equal to a given sum.
// For example.
// [2, 6, 9, 5, 10, -7]
// The pair for a sum of 15 is [9, 6]

func twoSum (numbers: [Int], sum: Int) -> [Int]? {
    if numbers.count > 1 { // no harm checking if we can even do this
        var map: [Int: Int] = [:]
        for num in numbers {
            let complement = sum - num
            if let other = map[complement] { // hey, this is cheating :-)
                return [num, other]
            } else {
                map[num] = num // didn't find it in the map, let's add it!
            }
        }
    }
    return nil
}

// let's test!
let test = [2, 6, 9, 5, 10, -7]
let result1 = twoSum(numbers: test, sum: 15) // returns [9, 6]
let result2 = twoSum(numbers: test, sum: 3) // returns [-7, 10]
let result3 = twoSum(numbers: test, sum: 22) // returns nil

