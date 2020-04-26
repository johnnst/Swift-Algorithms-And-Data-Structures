// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Maximum Contiguous Sum
// Given an array of numbers, find the contiguous subarray that has the largest sum.
// For example
// Given an array, [-2,1,-3,4,-1,2,1,-5,4]
// Contiguous subarray with the larget sum is [4, -1, 2, 1] and the sum is 6

func maxContiguousSumSubArray (numbers: [Int]) -> [Int]? {
    if numbers.count == 1 { // why bother to even run through the code, quick answer O(1)
        return numbers
    }
    
    if numbers.count > 1 {
        // trackers to compare
        var currentSum: Int = numbers[0]
        var max = numbers[0] // the secret sauce
        
        // keep track of where the subarray begins and end
        var startIndex = 0
        var endIndex = 0
        
        for (index, num) in numbers.enumerated() {
            if num > max {
                startIndex = index // figure out the startIndex
            }
            let newSum = currentSum + num
            
            currentSum = Swift.max(newSum, num)
            let newMax = Swift.max(max, currentSum) // this number always grows. Hint: See a trend!?
            if newMax > max {
                endIndex = index // figure out the endIndex
            }
            max = newMax
        }
        
        let subarray = numbers[startIndex ... endIndex].compactMap { $0 } // there is something funky about array slices, use flatMap to flatten the elements into a legit array of numbers
        return subarray
    }
    return nil
}

// let's test!
let test1 = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
let result1 = maxContiguousSumSubArray(numbers: test1) // prints [4, -1, 2, 1]
let sum1 = result1?.reduce(0, { x, y in
    x + y
})

let test2 = [-2, -1, -3, -4,-1, -2, -1, -5, -4]
let result2 = maxContiguousSumSubArray(numbers: test2) // prints [-1]

let test3 = [5]
let result3 = maxContiguousSumSubArray(numbers: test3) // prints [5]

let test4 = [5, -5]
let result4 = maxContiguousSumSubArray(numbers: test4) // prints [5]

let test5 = [-5, 5]
let result5 = maxContiguousSumSubArray(numbers: test5) // prints [5]


// Maximum Contiguous Sum
// Given an array of numbers, find the contiguous subarray that has the largest sum.
// For example
// Given an array, [-2,1,-3,4,-1,2,1,-5,4]
// Contiguous subarray with the larget sum is [4, -1, 2, 1] and the sum is 6
// Just calculate the sum function

func maxContiguousSum (numbers: [Int]) -> Int? {
    if numbers.count == 1 { // why bother to even run through the code, quick answer O(1)
        return numbers[0]
    }
    
    if numbers.count > 1 {
        // trackers to compare
        var currentSum: Int = numbers[0]
        var max = numbers[0] // the secret sauce
        
        for num in numbers {
            let newSum = currentSum + num
            
            currentSum = Swift.max(newSum, num)
            let newMax = Swift.max(max, currentSum) // this number always grows. Hint: See a trend!?
            max = newMax
        }
        return max
    }
    return nil // returning 0 is just wrong! 0 is a number
}

let test6 = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
let result6 = maxContiguousSum(numbers: test6) // prints a sum of 6
