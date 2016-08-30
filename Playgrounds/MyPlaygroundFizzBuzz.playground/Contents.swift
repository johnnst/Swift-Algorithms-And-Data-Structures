// John Ngoi
// FizzBuzz
// Write a function that prints the numbers from 1 to n.
// But for multiples of 3, print "Fizz" instead.
// For multiples of 5, print "Buzz" instead.
// For multiples of both 3 and 5, print "FizzBuzz" instead.
// Example series for n = 16
// 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16
//

func fizzBuzz (n: Int) -> String {
    var results = ""
    if n == 0 {
        return results
    }
    
    for i in 1 ... n {
        if i % 3 == 0 && i % 5 == 0 {
            results += " FizzBuzz"
        } else if i % 3 == 0 {
            results += " Fizz"
        } else if i % 5 == 0 {
            results += " Buzz"
        } else {
            results += " \(i)"
        }
    }
    return results
}

let test1 = fizzBuzz(31)
print(test1)
