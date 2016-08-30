//: Playground - noun: a place where people can play

import UIKit

// trie node

class TrieNode {
    var char: Character = "\0" // that's a null character
    var isWord = false // very important to flag a node as a word
    var children = [Character: TrieNode]() // the magic sauce
    
    init (char: Character, isWord: Bool) {
        self.char = char
        self.isWord = isWord
    }
}

class Trie {
    var root = TrieNode(char: "\0", isWord: false)
    
    func insert (word: String) {
        if word.characters.count > 0 { // protect your trie, don't allow zero characters
            var currentNode: TrieNode = self.root
            let wordLength = word.characters.count
            for (index, char) in word.characters.enumerate() {
                if currentNode.children[char] == nil {
                    let isWord = wordLength == (index + 1) ? true : false
                    currentNode.children[char] = TrieNode(char: char, isWord: isWord)
                } else {
                    continue // found a node, continue the traversal
                }
                currentNode = currentNode.children[char]!
            }
        }
    }
    
    func find (word: String) -> Bool {
        if word.characters.count > 0 {
            var currentNode: TrieNode = self.root
            for char in word.characters {
                if currentNode.children[char] == nil {
                    return false // word is not in trie
                } else {
                    if currentNode.children[char]!.isWord == true {
                        return true
                    } else {
                        currentNode = currentNode.children[char]!
                    }
                }
            }
        }
        return false
    }
}

// let's test the trie

let trie = Trie()
trie.insert("john")
trie.find("john") // returns true
trie.find("jon") // returns false
trie.find("lilian") // returns false
trie.insert("lilian")
trie.find("lilian") // returns true

