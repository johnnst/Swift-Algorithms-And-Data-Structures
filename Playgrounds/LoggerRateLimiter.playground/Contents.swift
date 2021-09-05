// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Given a string, find the longest substring without repeating characters.
//
// For example:
//
// text: defdefde, results: 3, "def"
// text: ded, results: 2 "de"
// text: dedfge, results 4, "edfg"
//
// Strategy
// We can do this with one pass through the string.
// To memorize the last seen character at an index, we can use a dictionary.
// Use two pointers, in this case, left and right, to measure the length of a substring with no repeating characters.
// Take the max each iteration and return the longest.
// Time O(n)
// Space O(n), dictionary space

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        guard s.count > 1 else { return 1 }
        
        let s = [Character](s)
        var dict: [Character: Int] = [:]
        var result = 0
        
        var left = 0
        for right in s.indices {
            if let index = dict[s[right]] {
                left = max(index + 1, left)
            }
            dict[s[right]] = right
            
            result = max(result, right - left + 1)
        }
        
        return result
    }
}

class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        if s.count == 1 {
            return 1
        }
        
        var left = 0
        var longest = 0
        
        let text = [Character](s)
        var hash = [Character: Int]()
        
        for i in 0..<text.count {
            if let position = hash[text[i]] {
                if position < left {
                    let length = i + 1 - left
                    if length > longest {
                        longest = length
                    }
                } else {
                    let length = i - left
                    if length > longest {
                        longest = length
                    }
                    left = position + 1
                }

            } else if i == (text.count - 1) {
                let length = i + 1 - left
                if length > longest {
                    longest = length
                }
            }
            
            hash[text[i]] = i
        }
        
        return longest
    }
}
