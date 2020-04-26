// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Big O examples

// Constant time
// O(1)
// We like constant time because it is predictable.

if 1 > 0 {
    print("yup")
}

// O(n)

let n = 12345
for i in 0 ... n {
    // do something n times
}

// O(n^2)
// slower than 0(n) by a lot

for i in 0 ... n {
    for j in 0 ... n {
        // do something n^2 times
    }
}


