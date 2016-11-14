//
// John Ngoi
// Swift 3
// Trie
//

class Node {
    var character: Character = "\0" // null character
    var isWord = false
    var children: [Character: Node]!
    
    init(character: Character, isWord: Bool) {
        self.character = character
        self.isWord = isWord
        self.children = [Character: Node]()
    }
}

class Trie {
    
    var root = Node(character: "\0", isWord: false)
    
    func insert (word: String) {
        if word.isEmpty {
            return
        }
        
        var currentNode = self.root
        
        for (index, char) in word.characters.enumerated() {
            if currentNode.children[char] == nil {
                let isWord = index == word.characters.count - 1 ? true : false
                currentNode.children[char] = Node(character: char, isWord: isWord)
                print("\(char) \(isWord)")
            }
            
            currentNode = currentNode.children[char]!
        }
    }
    
    func find (word: String) -> Bool {
        if word.isEmpty {
            return false
        }
        
        var currentNode = self.root
        
        for (char) in word.characters {
            guard let node = currentNode.children[char] else {
                return false
            }
            print("\(node.character) \(node.isWord)")
            if node.isWord {
                return true
            }
            
            currentNode = node
        }
        
        return false
    }
    
    func printAllWords () {
        
    }
}

let trie = Trie()
trie.insert(word: "john")
trie.insert(word: "jon")
trie.insert(word: "jonathan")

trie.find(word: "jo")
trie.find(word: "john")
trie.find(word: "jon")
trie.find(word: "jonathan")

trie.insert(word: "lilian")
trie.insert(word: "joel")

trie.find(word: "lillian")
trie.find(word: "lilian")
trie.find(word: "joel")

trie.find(word: "💩")
trie.insert(word: "💩")
trie.find(word: "💩")
