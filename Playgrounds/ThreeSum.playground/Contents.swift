// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// ThreeSum problem
// Given an array of numbers (at least 3), find the two number pairs that equal to a given sum.
// For example.
// [2, 6, 9, 5, 10, -7]
// The pair for a sum of 24 is [9, 5, 10]
// We could do brute force and come up with a O(n^3) answer, but we can certainly do better ~ O(n log n)

func ThreeSum (numbers: [Int], sum: Int) -> [Int]? {
    if numbers.count > 2 {
        // cannot escape going through the numbers once in one dimension
        // probably helpful if I could get the index
        // j and k will traverse from the left and right most end of the array and meet in the middle

        for (i, _) in numbers.enumerated() {
            var j = 1
            var k = numbers.count - 1
            while j < k {
                print("\(i) \(j) \(k) ")
                let a = numbers[i]
                let b = numbers[j]
                let c = numbers[k]
                if (a + b + c) == sum {
                    if i != j && i != k { // not so fast, you also have to check for non overlap before declaring victory
                        return [a, b, c]
                    }
                }
                
                // don't forget to increment and decrement
                j += 1
                k -= 1
            }
        }
    }
    return nil
}

// let's test!
let test = [2, 6, 9, 5, 10, -7]
let result1 = ThreeSum(numbers: test, sum: 21) // returns [2, 9, 10]
let result2 = ThreeSum(numbers: test, sum: 24) // returns [5, 9, 10]
let result3 = ThreeSum(numbers: test, sum: 25) // returns [6, 9, 10]
let result4 = ThreeSum(numbers: test, sum: 26) // returns nil
let result5 = ThreeSum(numbers: test, sum: 6) // returns nil



class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        
        var results = [[Int]]()
        let nums = nums.sorted { $0 < $1 }
        
        for i in 0..<nums.count-2 {
            if (i == 0 || (i > 0 && nums[i] != nums[i-1])) {
                var j = i + 1
                var k = nums.count - 1
                let sum = 0 - nums[i]
                
                while j < k {
                    if (nums[j] + nums[k]) == sum {
                        results.append([nums[i], nums[j], nums[k]])
                        while (j < k && nums[j] == nums[j + 1]) { j += 1 }
                        while (j < k && nums[k] == nums[k - 1]) { k -= 1 }
                        j += 1
                        k -= 1
                    } else if (nums[j] + nums[k]) > sum {
                        k -= 1
                    } else {
                        j += 1
                    }
                }
            }
        }
        
        return results
    }
}
