// John Ngoi
// Fibonacci
// Write a function that calculates for Fibonacci given a number n.
// For example, below is a Fibonacci series
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...


// recursive, O(2^n)
func fibonacciRecursive (n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2)
}

let test1 = fibonacciRecursive(10)

// iterative, O(n)
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

let test2 = fibonacciIterative(2)
let test3 = fibonacciIterative(10)

// memoize, using a dictionary as the secret sauce to improve the recursive performance
// performance is around O(n)
var map = [0: 0, 1: 1]
func fibonacciMemoize(n: Int) -> Int {
    if let value = map[n] {
        return value
    } else {
        let f = fibonacciMemoize(n - 1) + fibonacciMemoize(n - 2)
        map[n] = f
        return f
    }
}

let test4 = fibonacciMemoize(2)
let test5 = fibonacciMemoize(10)
let test6 = fibonacciMemoize(1)

// performance test
//let performanceRecursive = fibonacciRecursive(60)
//let performanceMemoize = fibonacciMemoize(60)
//let performanceIterative = fibonacciIterative(60)







