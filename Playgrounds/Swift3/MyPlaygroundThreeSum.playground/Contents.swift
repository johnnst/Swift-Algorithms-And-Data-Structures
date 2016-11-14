//
// John Ngoi
// Swift 3
// ThreeSum problem
// Given an array of numbers (at least 3), find the two number pairs that equal to a given sum.
// For example.
// [2, 6, 9, 5, 10, -7]
// The triad for a sum of 24 is [9, 5, 10]
// We could do brute force and come up with a O(n^3) answer, but we can certainly do better ~ O(n log n)
//

func threeSum (numbers: [Int], sum: Int) -> (Int, Int, Int)? {
    if numbers.count < 3 {
        return nil
    }
    
    for (i, _) in numbers.enumerated() {
        var j = 1
        var k = numbers.endIndex - 1
        while j < k {
            let a = numbers[i]
            let b = numbers[j]
            let c = numbers[k]
            if (a + b + c) == sum {
                if i != j && i != k {
                    return (a, b, c)
                }
            }
            j += 1
            k -= 1
        }
    }
    return nil
}

let numbers = [2, 6, 9, 5, 10, -7]
let triad = threeSum(numbers: numbers, sum: 24)
let triad2 = threeSum(numbers: numbers, sum: 1)
let triad3 = threeSum(numbers: numbers, sum: 2)
let triad4 = threeSum(numbers: numbers, sum: 3)
let triad5 = threeSum(numbers: numbers, sum: 4)
