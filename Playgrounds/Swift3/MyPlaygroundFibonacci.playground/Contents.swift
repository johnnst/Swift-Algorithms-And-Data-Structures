//
// John Ngoi
// Swift 3
// Fibonacci
// Write a function that calculates for Fibonacci given a number n
// For example
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
//

// recursive
// O(2 ^ n)
func fibonacciRecursive (n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    return (fibonacciRecursive(n: n - 1) + fibonacciRecursive(n: n - 2))
}

let r1 = fibonacciRecursive(n: 2)
let r2 = fibonacciRecursive(n: 3)
let r3 = fibonacciRecursive(n: 4)
let r4 = fibonacciRecursive(n: 5)
let r5 = fibonacciRecursive(n: 10)

// iterative
// O(n)
func fibonacciIterative (n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    var a = 0 // n - 2
    var b = 1 // n - 1
    
    for _ in 2 ... n {
        let c = a + b
        a = b
        b = c
    }
    return b
}

let i1 = fibonacciIterative(n: 2)
let i2 = fibonacciIterative(n: 3)
let i3 = fibonacciIterative(n: 4)
let i4 = fibonacciIterative(n: 5)
let i5 = fibonacciIterative(n: 10)

// memoize
// O(n)
var map: [Int: Int] = [1:1, 0:0]
func fibonacciMemoize (n: Int) -> Int {
    if let num = map[n] {
        return num
    } else {
        if let x = map[n - 1],
            let y = map[n - 2] {
            let z = x + y
            map[n] = z
        }
    }

    return (fibonacciMemoize(n: n - 1) + fibonacciMemoize(n: n - 2))
}

let m1 = fibonacciMemoize(n: 2)
let m2 = fibonacciMemoize(n: 3)
let m3 = fibonacciMemoize(n: 4)
let m4 = fibonacciMemoize(n: 5)
let m5 = fibonacciMemoize(n: 6)
let m6 = fibonacciMemoize(n: 7)
let m7 = fibonacciMemoize(n: 10)

// performance test
// uncomment each line one at a time and observe
//let performanceRecursive = fibonacciRecursive(n: 60)
//let performanceIterative = fibonacciIterative(n: 60)
//let performanceMemoize = fibonacciMemoize(n: 60)







