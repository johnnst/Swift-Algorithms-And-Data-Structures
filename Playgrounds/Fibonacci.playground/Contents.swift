// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Fibonacci
// Write a function that calculates for Fibonacci given a number n.
// For example, below is a Fibonacci series
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...


// Recursive approach
// Time O(2^n)
// Space O(n)
func fibonacciRecursive (n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    return fibonacciRecursive(n: n - 1) + fibonacciRecursive(n: n - 2)
}

let test1 = fibonacciRecursive(n: 10)

// Iterative approach
// Time O(n)
// Space O(1)
func fibonacciIterative (n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    var sum = 1
    var previous = 0
    
    for _ in 2 ... n {
        let newSum = sum + previous
        previous = sum
        sum = newSum
    }
    return sum
}

let test2 = fibonacciIterative(n: 2)
let test3 = fibonacciIterative(n: 10)

// memoize, using a dictionary as the secret sauce to improve the recursive performance
// Time O(n)
// Space O(n), due to the dictionary used
var map = [0: 0, 1: 1]
func fibonacciMemoize(n: Int) -> Int {
    if let value = map[n] {
        return value
    } else {
        let f = fibonacciMemoize(n: n - 1) + fibonacciMemoize(n: n - 2)
        map[n] = f
        return f
    }
}

let test4 = fibonacciMemoize(n: 2)
let test5 = fibonacciMemoize(n: 10)
let test6 = fibonacciMemoize(n: 1)

// performance test
//let performanceRecursive = fibonacciRecursive(n: 60)
//let performanceMemoize = fibonacciMemoize(n: 60)
//let performanceIterative = fibonacciIterative(n: 60)
