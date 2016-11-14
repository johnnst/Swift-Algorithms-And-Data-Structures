//
// John Ngoi
// Swift 3
// Reversed Linked List
// Given a linked list, reverse it.
//

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

// create nodes
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)

// link them
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

// print the nodes as a way to test
func printNodes (root: Node?) {
    guard let node = root else {
        print("Empty Linked List!")
        return
    }
    
    var currentNode = node
    while currentNode.next != nil {
        print(currentNode.value)
        currentNode = currentNode.next!
    }
    print(currentNode.value)
}

printNodes(root: node1)

func reversedLinkedList (root: Node?) -> Node? {
    guard let node = root else {
         return nil
    }
    
    var currentNode: Node? = node
    var previousNode: Node?
    while currentNode != nil {
        let next = currentNode?.next
        currentNode?.next = previousNode
        previousNode = currentNode
        currentNode = next
    }
    return previousNode
}

let reversed = reversedLinkedList(root: node1)
printNodes(root: reversed)





