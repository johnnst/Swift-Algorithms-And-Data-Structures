//: Playground - noun: a place where people can play
import Foundation

/// Simple trie node class.
class TrieNode {
    var char: Character = "\0" // that's a null character
    var isWord = false // very important to flag a node as a word
    private var children = [Character: TrieNode]() // the magic sauce, set to private to avoid accidents
    
    init (char: Character, isWord: Bool) {
        self.char = char
        self.isWord = isWord
    }
    
    func getChildren() -> [Character: TrieNode] {
        return children
    }
    
    func getChild(for char: Character) -> TrieNode? {
        if let child = self.children[char] {
            return child
        }
        return nil
    }
    
    func addChild(for char: Character, isWord: Bool) {
        if children[char] == nil {
            children[char] = TrieNode(char: char, isWord: isWord)
        }
    }
    
    func update(isWord: Bool) {
        self.isWord = isWord
    }
    
}

/// A simple trie class.
class Trie {
    var root = TrieNode(char: "\0", isWord: false)
    
    /// Inserts the word into the trie.
    ///
    /// - Parameter word: Text to be inserted.
    func insert (word: String) {
        if word.count > 0 { // protect your trie, don't allow zero characters
            var currentNode: TrieNode = self.root
            for (index, char) in word.enumerated() {
                let isWord = word.count == (index + 1) ? true : false
                if let childNode = currentNode.getChild(for: char) {
                    if isWord {
                        childNode.update(isWord: true)
                        break
                    }
                } else {
                    currentNode.addChild(for: char, isWord: isWord)
                }
                currentNode = currentNode.getChild(for: char)!
            }
        }
    }
    
    /// Look up a word from the trie.
    ///
    /// - Parameter word: Text to look up.
    /// - Returns: (true) if found; (false) if not.
    func find (word: String) -> Bool {
        if word.count > 0 {
            var currentNode: TrieNode = self.root
            for (index, char) in word.enumerated() {
                print("""
                    
                    find word stats
                    index = \(index)
                    char = \(char)
                    currentNode.char = \(currentNode.char)
                    currentNode.isWord = \(currentNode.isWord)
                    """)
                if let childNode = currentNode.getChild(for: char) {
                    print("""
                        childNode.char = \(childNode.char)
                        childNode.isWord = \(childNode.isWord)
                        """)
                    if index == (word.count - 1) {
                        if childNode.isWord == true {
                            print("found word \(word)")
                            return true
                        }
                    }
                } else {
                    print("did not find \(word)")
                    return false
                }
                if let childNode = currentNode.getChild(for: char) {
                    currentNode = childNode
                }
            }
        }
        print("did not find \(word)")
        return false
    }
}

// let's test the trie

let trie = Trie()
trie.insert(word: "john")
trie.find(word: "john") // returns true
trie.find(word: "jon") // returns false
trie.find(word: "lilian") // returns false
trie.insert(word: "lilian")
trie.find(word: "lilian") // returns true
trie.find(word: "lillian") // returns false
trie.insert(word: "jonathan")
trie.insert(word: "joel")
trie.find(word: "john") // returns true
trie.find(word: "jon") // returns false
trie.find(word: "jonathen") // returns false
trie.find(word: "joel") // returns true
trie.find(word: "jonathan") // returns true
trie.find(word: "james") // returns false
trie.insert(word: "jim")
trie.insert(word: "james")
trie.find(word: "jimbo") // returns false
trie.find(word: "james") // returns true
