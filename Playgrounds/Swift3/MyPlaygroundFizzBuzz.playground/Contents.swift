//
// John Ngoi
// Swift 3
// FizzBuzz
// Write a function that prints the numbers from 1 to n.
// But for multiples of 3, print "Fizz" instead.
// For multiples of 5, print "Buzz" instead.
// For multiples of both 3 and 5, print "FizzBuzz" instead.
// Example series for n = 16
// 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16
//

func fizzBuzz (num: Int) -> String {
    var results = [String]()
    for i in 1 ... num {
        if i % 3 == 0 && i % 5 == 0 {
            results.append("FizzBuzz")
        } else if i % 3 == 0 {
            results.append("Fizz")
        } else if i % 5 == 0 {
            results.append("Buzz")
        } else {
            results.append("\(i)")
        }
    }
    
    return results.joined(separator: " ")
}

print(fizzBuzz(num: 1))
print(fizzBuzz(num: 5))
print(fizzBuzz(num: 16))
