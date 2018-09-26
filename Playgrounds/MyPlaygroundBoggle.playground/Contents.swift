// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Boggle, find all possible words in a board of characters
// Given a dictionary, and a M x N board with a character in each cell, find all possible words that can be formed by a sequence of adjacent characters.
// We can move in any of the 8 adjacent characters but a word should not have multiple instances of same cell.
// Hint: We will use a Trie to solve for this.

// create a trie
class TrieNode {
    var letter: Character
    var isWord: Bool
    var children = [Character: TrieNode]()
    
    init (letter le: Character, isWord iw: Bool) {
        self.letter = le
        self.isWord = iw
    }
}

class Trie {
    var root: TrieNode = TrieNode(letter: "\0", isWord: false)
    
    func insertWord (word: String) {
        let wordLength = word.count
        var currentNode: TrieNode? = root
        var letterCounter = 0
        
        for letter in word {
            letterCounter = letterCounter + 1
            
            let isWord = letterCounter == wordLength ? true : false
            
            if currentNode!.children[letter] == nil {
                currentNode!.children[letter] = TrieNode(letter: letter, isWord: isWord)
            }
            currentNode = currentNode!.children[letter]
        }
    }
    
    func find (key: String) -> String? {
        let keyLength = key.count
        
        var currentNode: TrieNode? = self.root
        var characterCount = 0
        
        for character in key {
            currentNode = currentNode!.children[character]
            
            if currentNode == nil {
                return nil
            }
            
            characterCount = characterCount + 1
            
            if characterCount == keyLength && currentNode!.isWord == true {
                return key
            }
        }
        
        return nil
    }
}

// test your trie
var trie: Trie = Trie()
trie.insertWord(word: "nicolas")
trie.insertWord(word: "nighthawk")
trie.find(key: "nicolas")
trie.find(key: "john")
trie.find(key: "nighthawk")
trie.insertWord(word: "lilian")
trie.find(key: "lilian")

// solving Boggle using a trie

// boggle 2D array
let boggle = [["T", "F", "F"],
              ["U", "H", "K"],
              ["N", "S", "I"]
]

// first add the words to the trie
var wordsTrie = Trie()
wordsTrie.insertWord(word: "THIS")
wordsTrie.insertWord(word: "IS")
wordsTrie.insertWord(word: "FUN")
wordsTrie.insertWord(word: "STUFF")

// once we loaded up our trie with words, implement the find function
func findWords (boggle: [[String]]) -> [String]? {
    let rows = boggle.count
    let cols = boggle[0].count
    var words = [String]()
    var queue = [(x: Int, y: Int, prefix: String, node: TrieNode)]()
    
    // setup the initial queue
    for (i, col) in boggle.enumerated() {
        for (j, char) in col.enumerated() {
            if let node = wordsTrie.root.children[Character(char)] {
                queue.append((x: i, y: j, prefix: char, node: node))
            }
        }
    }
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for (dx, dy) in [(1,0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1)] { // this one is funky, basically go all 8 possible directions
            let x2 = node.x + dx
            let y2 = node.y + dy
            
            if x2 >= 0 && x2 < cols && y2 >= 0 && y2 < rows { // off course, you want to make sure you keep within the boggle board
                let char2 = boggle[x2][y2]
                let prefix2 = node.prefix + char2
                if let node2 = node.node.children[Character(char2)] {
                    if node2.isWord == true {
                        words.append(prefix2)
                    }
                    queue.append((x: x2, y: y2, prefix: prefix2, node: node2))
                }
            }
        }
    }
    
    return words
}

findWords(boggle: boggle) // returns ["IS", "FUN", "THIS"]
