// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Factorials
// Example
// 6! = 6 * 5 * 4 * 3 * 2 * 1 = 720

let a = 6 * 5 * 4 * 3 * 2 * 1

func factorialRecursive (n: Int) -> Int {
    if n == 1 {
        return 1
    }
    
    return factorialRecursive(n: n - 1) * n
}

let b = factorialRecursive(n: 6)


func factorialIterative (n: Int) -> Int {
    var results = 1
    for i in 1 ... n {
        results *= i
    }
    return results
}

let c = factorialRecursive(n: 6)


// performance tests!
//let p1 = factorialRecursive(15)
//let p2 = factorialIterative(15)
