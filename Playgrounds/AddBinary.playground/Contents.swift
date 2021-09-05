// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
//    Given two binary strings a and b, return their sum as a binary string.
//
//    Example 1:
//
//    Input: a = "11", b = "1"
//    Output: "100"
//    Example 2:
//
//    Input: a = "1010", b = "1011"
//    Output: "10101"
//
//
//    Constraints:
//
//    1 <= a.length, b.length <= 104
//    a and b consist only of '0' or '1' characters.
//    Each string does not contain leading zeros except for the zero itself.
                                                        
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        guard a.count > 0 && b.count > 0 else { return "" }
        
        var carry = 0
        
        let dict: [Character: Int] = ["0": 0, "1": 1]
        
        let a = [Character](a)
        let b = [Character](b)
        
        var i = a.count - 1
        var j = b.count - 1
        var answer = ""
        
        while i >= 0 && j >= 0 {
            let x = dict[a[i]]!
            let y = dict[b[j]]!
            
            let sum = x + y + carry
            answer = "\(sum % 2)" + answer
            carry = sum / 2
            
            i -= 1
            j -= 1
        }
        
        while i >= 0 {
            let sum = dict[a[i]]! + carry
            answer = "\(sum % 2)" + answer
            carry = sum / 2
            
            i -= 1
        }
        
        while j >= 0 {
            let sum = dict[b[j]]! + carry
            answer = "\(sum % 2)" + answer
            carry = sum / 2
            
            j -= 1
        }
        
        if carry > 0 {
            answer = "\(carry)" + answer
        }
        return answer
    }
}
