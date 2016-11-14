// John Ngoi
// Factorials
// Example
// 6! = 6 * 5 * 4 * 3 * 2 * 1 = 720

let a = 6 * 5 * 4 * 3 * 2 * 1

func factorialRecursive (n: Int) -> Int {
    if n == 1 {
        return 1
    }
    
    return factorialRecursive(n - 1) * n
}

let b = factorialRecursive(6)


func factorialIterative (n: Int) -> Int {
    var results = 1
    for i in 1 ... n {
        results *= i
    }
    return results
}

let c = factorialRecursive(6)


// performance tests!
//let p1 = factorialRecursive(15)
//let p2 = factorialIterative(15)






