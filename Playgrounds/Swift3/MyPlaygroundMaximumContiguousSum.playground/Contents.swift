//
// John Ngoi
// Swift 3
// Maximum Contiguous Sum
// Given an array of numbers, find the contiguous subarray that has the largest sum.
// For example
// Given an array, [-2,1,-3,4,-1,2,1,-5,4]
// Contiguous subarray with the larget sum is [4, -1, 2, 1] and the sum is 6
//

func maxSum (numbers: [Int]) -> [Int]? {
    if numbers.count == 1 {
        return numbers
    }
    
    if numbers.count > 1 {
        // track the indexes to return
        var firstIndex = 0
        var endIndex = 0
        
        // sum trackers
        var currentSum = 0
        var max = numbers[0]
        
        for (index, num) in numbers.enumerated() {
            
            let newSum = currentSum + num
            currentSum = Swift.max(newSum, num) // secret sauce. If num is big enough to displace the previous results, then reset the starting result index to the current index.
            if currentSum > newSum {
                firstIndex = index
            }
             
            let newMax = Swift.max(max, currentSum) // this number always grows. Hint: See a trend?!
            if newMax > max {
                endIndex = index
            }
            max = newMax
        }
        
        let results = numbers[firstIndex ... endIndex].flatMap({ $0 })
        return results
    }
    
    return nil
}

let numbers = [-2,1,-3,4,-1,2,1,-5,4]
if let results = maxSum(numbers: numbers) {
    let sum = results.reduce(0, +)
}

let numbers2 = [1, 2, 8, 4, -1, 5, -7, 3]
if let results2 = maxSum(numbers: numbers2) {
    let sum2 = results2.reduce(0, +)
}

let numbers3 = [6 ,5, 4, 3, -2, -100, 200, -10]
if let results3 = maxSum(numbers: numbers3) {
    let sum3 = results3.reduce(0, +)
}



