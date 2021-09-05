// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
//    Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.
//
//    You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.
//
//
//
//    Example 1:
//
//    Input: num1 = "11", num2 = "123"
//    Output: "134"
//    Example 2:
//
//    Input: num1 = "456", num2 = "77"
//    Output: "533"
//    Example 3:
//
//    Input: num1 = "0", num2 = "0"
//    Output: "0"
//
//
//    Constraints:
//
//    1 <= num1.length, num2.length <= 104
//    num1 and num2 consist of only digits.
//    num1 and num2 don't have any leading zeros except for the zero itself.

// Solved using String indexes
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let dict: [Character: Int] = ["0": 0,
                                     "1": 1,
                                     "2": 2,
                                     "3": 3,
                                     "4": 4,
                                     "5": 5,
                                     "6": 6,
                                     "7": 7,
                                     "8": 8,
                                     "9": 9]
        
        var l1 = num1.count - 1
        var l2 = num2.count - 1
        
        var carry = 0
        var results = ""
        
        while l1 >= 0 || l2 >= 0 {
            let n1 = l1 >= 0 ? num1[num1.index(num1.startIndex, offsetBy: l1)] : "0"
            let n2 = l2 >= 0 ? num2[num2.index(num2.startIndex, offsetBy: l2)] : "0"
            
            let d1 = dict[n1]!
            let d2 = dict[n2]!
            
            let sum = d1 + d2 + carry
            let value = sum % 10
            results = String(value) + results
            carry = sum / 10
            
            l1 -= 1
            l2 -= 1
        }
        
        if carry > 0 {
            results = String(carry) + results
        }
        
        return results
    }
}


// faster answer below, String indexes are slow!!!
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let dict: [Character: Int] = ["0": 0,
                                     "1": 1,
                                     "2": 2,
                                     "3": 3,
                                     "4": 4,
                                     "5": 5,
                                     "6": 6,
                                     "7": 7,
                                     "8": 8,
                                     "9": 9]
        
        let num1 = [Character](num1)
        let num2 = [Character](num2)
        
        var carry = 0
        var answer = ""
        
        var i = num1.count - 1
        var j = num2.count - 1
        
        while i >= 0 && j >= 0 {
            let n1 = dict[num1[i]]!
            let n2 = dict[num2[j]]!
            
            let sum = n1 + n2 + carry
            carry = sum / 10
            let value = sum % 10
            answer = "\(value)" + answer
            
            i -= 1
            j -= 1
        }
        
        // print(answer)
        // print("i: \(i)")
        // print("j: \(j)")
        while i >= 0 {
            let n = dict[num1[i]]!
            let sum = n + carry
            carry = sum / 10
            let value = sum % 10
            answer = "\(value)" + answer
            i -= 1
        }
        
        while j >= 0 {
            let n = dict[num2[j]]!
            let sum = n + carry
            carry = sum / 10
            let value = sum % 10
            answer = "\(value)" + answer
            j -= 1
        }
        
        if carry > 0 {
            answer = "\(carry)" + answer
        }
        
        return answer
    }
}
