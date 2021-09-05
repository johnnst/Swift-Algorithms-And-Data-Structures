//Design a data structure that supports adding new words and finding if a string matches any previously added string.
//
//Implement the WordDictionary class:
//
//WordDictionary() Initializes the object.
//void addWord(word) Adds word to the data structure, it can be matched later.
//bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
//
//
//Example:
//
//Input
//["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
//[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
//Output
//[null,null,null,null,false,true,true,true]
//
//Explanation
//WordDictionary wordDictionary = new WordDictionary();
//wordDictionary.addWord("bad");
//wordDictionary.addWord("dad");
//wordDictionary.addWord("mad");
//wordDictionary.search("pad"); // return False
//wordDictionary.search("bad"); // return True
//wordDictionary.search(".ad"); // return True
//wordDictionary.search("b.."); // return True
//
//
//Constraints:
//
//1 <= word.length <= 500
//word in addWord consists lower-case English letters.
//word in search consist of  '.' or lower-case English letters.
//At most 50000 calls will be made to addWord and search.
//
//
//


class TrieNode {
    let value: Character
    var children = [Character: TrieNode]()
    var isWord = false
    
    init(value: Character) {
        self.value = value
    }
}
class WordDictionary {

    let root = TrieNode(value: "\0")
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        let word = [Character](word)
        
        for i in 0..<word.count {
            if let child = currentNode.children[word[i]] {
                currentNode = child
            } else {
                currentNode.children[word[i]] = TrieNode(value: word[i])
                currentNode = currentNode.children[word[i]]!
            }
        }
        
        currentNode.isWord = true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
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


