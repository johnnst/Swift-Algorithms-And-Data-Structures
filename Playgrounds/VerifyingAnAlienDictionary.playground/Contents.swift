// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
//    In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
//
//    Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.
//
//    Example 1:
//
//    Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
//    Output: true
//    Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
//
//    Example 2:
//
//    Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
//    Output: false
//    Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
//
//    Example 3:
//
//    Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
//    Output: false
//    Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
//
//    Constraints:
//
//    1 <= words.length <= 100
//    1 <= words[i].length <= 20
//    order.length == 26
//    All characters in words[i] and order are English lowercase letters.

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard order.count > 1 else { return true }
        guard words.count > 1 else { return true }
        
        var dict = [Character: Int]()
        for (index, c) in order.enumerated() {
            dict[c] = index
        }
        
        for i in 0..<(words.count - 1) {
            let word1 = words[i]
            let word2 = words[i+1]
            
            var check = true
            let shortestLength = min(word1.count, word2.count)
            for j in 0..<shortestLength {
                let c1 = word1[word1.index(word1.startIndex, offsetBy: j)]
                let c2 = word2[word2.index(word2.startIndex, offsetBy: j)]
                
                if c1 != c2 {
                    if dict[c1]! > dict[c2]! {
                        return false
                    }
                    check = false
                    break
                }
            }
            
            if word1.count > word2.count && check {
                // print(word1)
                // print(word2)
                return false
            }
        
        }
        
        return true
    }
}


// faster solution below
// hint: String indexes are slow
class Solution2 {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else { return true }
        guard order.count > 0 else { return true }
        
        var dict: [Character: Int] = [:]
        
        // store order in a dictionary
        for (index, c) in order.enumerated() {
            dict[c] = index
        }
        
        for i in 1..<words.count {
            let word2 = [Character](words[i])
            let word1 = [Character](words[i-1])
            
            // print()
            // print("word1: \(word1)")
            // print("word2: \(word2)")
            
            var shouldBreak = false
            let shortest = min(word1.count, word2.count)
            
            for j in 0..<shortest {
                let left = dict[word1[j]]!
                let right = dict[word2[j]]!
                
                // print("left: \(left) \(word1[j])")
                // print("right: \(right) \(word2[j])")
                
                if right < left {
                    return false
                }
                
                if left < right {
                    // print("break")
                    shouldBreak = true
                    break
                }
            }
            
            if shouldBreak {
                continue
            } else {
                if word1.count > word2.count {
                    return false
                }
            }
        }
        
        return true
    }
}
