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

class Node {
    var key: Int
    var value: Int
    var prev: Node?
    var next: Node?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    
    var tail = Node(key: 0, value: 0)
    var head = Node(key: 0, value: 0)
    var dict: [Int: Node]
    var capacity: Int
    var size: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        self.size = 0
        dict = [:]
        head.next = tail
        tail.prev = head
    }
    
    func add(node: Node) {
        node.prev = head
        node.next = head.next
        
        head.next!.prev = node
        head.next = node
    }
    
    func remove(node: Node) {
        var prev = node.prev
        var new = node.next
        
        prev!.next = new
        new!.prev = prev
    }
    
    func moveToHead(node: Node) {
        remove(node: node)
        add(node: node)
    }
    
    func popTail() -> Node {
        var res = tail.prev
        remove(node: res!)
        return res!
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveToHead(node: node)
            return node.value
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            moveToHead(node: node)
        } else {
            var new = Node(key: key, value: value)
            dict[key] = new
            add(node: new)
            
            if size == capacity {
                var pop = popTail()
                dict[pop.key] = nil
            } else {
                size += 1
            }
        }
        
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
