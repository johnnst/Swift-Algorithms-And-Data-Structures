// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Given a string, find the longest palindromic substring.
//
// For example:
//
// text: babad, results: aba, OR bab
// text: abba, results: abba
// text: abc, results can either be a, b OR, c
//
// Strategy
// Think of the sub problem, we can easily determine the longest palindrome from the center of any given string.
// Write a sub function to determine the longest length of a palindrome from any given index in the string.
// Then, iterate through the string to get the middle indexes.
// Time O(n^2)
// Space O(1)

func longestPalindrome(_ text: String) -> String {
    func expandFromMiddle(_ s: [Character], left: Int, right: Int) -> Int {
        var left = left
        var right = right
        
        while (left >= 0 && right < s.count && s[left] == s[right]) {
            left -= 1
            right += 1
        }
        
        return right - left - 1
    }
    
    guard !text.isEmpty else { return text }
    if text.count == 1 { return text }
    
    let s = [Character](text)
    var start = 0
    var end = 0
    
    for i in 0..<s.count {
        let len1 = expandFromMiddle(s, left: i, right: i)
        let len2 = expandFromMiddle(s, left: i, right: i + 1)
        let len = max(len1, len2)
        
        if len > (end - start) {
            start = i - (len - 1) / 2
            end = i + len / 2
        }
    }
    
    return String(s[start...end])
}

func printResults(_ text: String) {
    print("\(text), results is \(longestPalindrome(text))")
}

printResults("abba")
printResults("abc")
printResults("babad")
printResults("cbbd")
printResults("qiruqhrfkwafhajafsh")
