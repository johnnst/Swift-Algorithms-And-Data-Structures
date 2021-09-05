// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Given a string, find the longest valid parentheses.
//
// For example:
//
// text: ()), results: 2
// text: ((()), results: 4
// text: (()()()(, results 6
//
// Strategy
// Scan from left to right to find the longest valid parentheses.
// Notice, you may not get the longest for certain edge cases.
// Then you will need to run another loop to scan from right to left.
// And finally, return the max length from both scans.
// Time O(n)
// Space O(1)

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count > 1 else { return 0 }
        
        let s = [Character](s)
        var left = 0, right = 0, maxLen = 0
        
        for i in 0..<s.count {
            let char = s[i]
            if char == "(" {
                left += 1
            } else {
                right += 1
            }
            
            if left == right {
                maxLen = max(maxLen, (right * 2))
            } else if right >= left {
                left = 0
                right = 0
            }
        }
        
        left = 0
        right = 0
        
        for i in (0..<s.count).reversed() {
            let char = s[i]
            if char == "(" {
                left += 1
            } else {
                right += 1
            }
            
            if left == right {
                maxLen = max(maxLen, (left * 2))
            } else if left >= right {
                left = 0
                right = 0
            }
        }
        return maxLen
    }
}
