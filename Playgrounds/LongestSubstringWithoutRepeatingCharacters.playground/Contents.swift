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

class Logger {

    var hash = [String: Int]() // message: timestamp

    init() { }

    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        guard !message.isEmpty else { return false }
        
        if let t = hash[message] {
            if timestamp > (t + 9) {
                hash[message] = timestamp
                return true
            } else {
                return false
            }
        }
        hash[message] = timestamp
        return true
    }

}

