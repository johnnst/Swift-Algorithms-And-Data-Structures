//
// John Ngoi
// Swift 3
// Boggle, find all possible words in a board of characters
// Given a dictionary, and a M x N board with a character in each cell, find all possible words that can be formed by a sequence of adjacent characters.
// We can move in any of the 8 adjacent characters but a word should not have multiple instances of same cell.
// Hint: We will use a Trie to solve for this.
//

class Node {
    var value: Character
    var isWord = false
    var children = [Character: Node]()
    
    init(character: Character, isWord: Bool) {
        self.value = character
        self.isWord = isWord
    }
}

class Trie {
    var root: Node = Node(character: "\0", isWord: false)
    
    func insert(word: String) {
        var currentNode = root

        for (index, char) in word.characters.enumerated() {
            let isWord = (word.characters.count - 1) == index ? true : false
            if let node = currentNode.children[char] {
                node.isWord = isWord
            } else {
                let node = Node(character: char, isWord: isWord)
                currentNode.children[char] = node
            }
            currentNode = currentNode.children[char]!
        }
    }
    
    func find(word: String) -> Bool {
        var currentNode = root
        
        for (index, char) in word.characters.enumerated() {
            if let node = currentNode.children[char] {
                let isWord = (word.characters.count - 1) == index ? true : false
                if isWord && node.isWord {
                    return true
                }
                currentNode = node
            } else {
                return false
            }
        }
        return false
    }
}

let trie = Trie()
trie.find(word: "john")
trie.insert(word: "john")
trie.find(word: "john")
trie.find(word: "joh")
trie.find(word: "johns")
trie.find(word: "💩")
trie.insert(word: "💩")
trie.find(word: "💩")

// Solving Boggle using a trie.

// Boggle 2D array.
let boggle = [["T", "F", "F"],
              ["U", "H", "K"],
              ["N", "S", "I"]
]

// First add the words to the trie.
var wordsTrie = Trie()
wordsTrie.insert(word: "THIS")
wordsTrie.insert(word: "IS")
wordsTrie.insert(word: "FUN")
wordsTrie.insert(word: "STUFF")

// Once we loaded up our trie with words, implement the find words function.
func findWords (boggle: [[String]]) -> [String]? {
    let rows = boggle.count
    let columns = boggle[0].count
    var words = [String]()
    var queue = [(x: Int, y: Int, prefix: String, node: Node)]()
    
    // Setup initial queue.
    for (i, col) in boggle.enumerated() {
        for (j, char) in col.enumerated() {
            if let node = wordsTrie.root.children[Character(char)] {
                queue.append((x: i, y: j, prefix: char, node: node))
            }
        }
    }
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for (dx, dy) in [(1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1)] {
            let x2 = node.x + dx
            let y2 = node.y + dy
            
            if x2 >= 0 && x2 < columns && y2 >= 0 && y2 < rows {
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

findWords(boggle: boggle)


