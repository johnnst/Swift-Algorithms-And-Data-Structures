// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Design a data structure that supports adding new words and finding if a string matches any previously added string.
//
// Implement the WordDictionary class:
//
// WordDictionary() Initializes the object.
// void addWord(word) Adds word to the data structure, it can be matched later.
// bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
//
//
// Example:
//
// Input
// ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
// [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
// Output
// [null,null,null,null,false,true,true,true]
//
// Explanation
// WordDictionary wordDictionary = new WordDictionary();
// wordDictionary.addWord("bad");
// wordDictionary.addWord("dad");
// wordDictionary.addWord("mad");
// wordDictionary.search("pad"); // return False
// wordDictionary.search("bad"); // return True
// wordDictionary.search(".ad"); // return True
// wordDictionary.search("b.."); // return True
//
//
// Constraints:
//
// 1 <= word.length <= 500
// word in addWord consists lower-case English letters.
// word in search consist of  '.' or lower-case English letters.
// At most 50000 calls will be made to addWord and search.
//

class TrieNode {
    var val: Character
    var children: [Character: TrieNode] = [:]
    var isWord = false
    
    init(_ val: Character) {
        self.val = val
    }
}

class WordDictionary {
    
    let root = TrieNode(Character("\0"))

    init() {}
    
    func addWord(_ word: String) {
        var cur = root
        
        for c in word {
            if cur.children[c] == nil {
                cur.children[c] = TrieNode(c)
            }
            cur = cur.children[c]!
        }
        cur.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        
        func dfsSearch(children: [Character: TrieNode], word: [Character], start: Int) -> Bool {
            if start == word.count {
                if children.count == 0 {
                    return true
                } else {
                    return false
                }
            }
            
            let c = word[start]
            
            if let child = children[c] {
                if child.isWord && (start == (word.count - 1)) {
                    return true
                }
                return dfsSearch(children: child.children, word: word, start: start + 1)
            } else if c == "." {
                for child in children.values {
                    if start == (word.count - 1) && child.isWord {
                        return true
                    }
                    
                    if dfsSearch(children: child.children, word: word, start: start + 1) {
                        return true
                    }
                }
                return false
            }
            return false
        }
        
        return dfsSearch(children: root.children, word: [Character](word), start: 0)

    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
