//
// John Ngoi
// Swift 3
// Linked List
//

class Node<T: Hashable> {
    var data: T
    var node: Node?
    
    init(data: T) {
        self.data = data
    }
    
    init(data: T, node: Node?) {
        self.data = data
        self.node = node
    }
}

class LinkedList {
    var root: Node<Int>?
}

let node1 = Node(data: 9)
let node2 = Node(data: 7, node: node1)
let node3 = Node(data: 4, node: node2)


