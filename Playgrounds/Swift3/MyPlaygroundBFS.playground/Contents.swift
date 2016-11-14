//
// John Ngoi
// Swift 3
// Breadth First Search (BFS)
// Simple implementation of BFS
// Given a graph of nodes (directed), find the number of nodes it will take from one node to another, do not count the starting node
// BONUS: This algorithm also returns the path!
//

class Node: Equatable {
    var value: Int
    var isVisited = false
    var neighbors = [Node]()
    var path = [Node]()
    
    init(value: Int) {
        self.value = value
    }
}

func == (rhs: Node, lhs: Node) -> Bool {
    return rhs.value == lhs.value
}

func bfs (from: Node, to: Node) -> [Node]? {
    if from == to {
        return [from]
    }
    
    var queue = [Node]() // magic sauce
    queue.append(from)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        node.isVisited = true
        node.path.append(node)
        if node == to {
            return node.path
        }
        
        for neighbor in node.neighbors {
            if !neighbor.isVisited {
                neighbor.isVisited = true
                neighbor.path.append(contentsOf: node.path)
                queue.append(neighbor)
            }
        }
    }
    return nil
}

// create the nodes
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)
let node6 = Node(value: 6)
let node7 = Node(value: 7)
let node8 = Node(value: 8)
let node9 = Node(value: 9)

// create the graph from the nodes
node1.neighbors = [node2, node3, node4]
node3.neighbors = [node6]
node4.neighbors = [node5]
node6.neighbors = [node8, node9]
node5.neighbors = [node7]
node7.neighbors = [node9]
node8.neighbors = [node7]

//if let path1 = bfs(from: node1, to: node7) {
//    for p in path1 {
//        print(p.value)
//    }
//}

if let path2 = bfs(from: node1, to: node9) {
    for p in path2 {
        print(p.value)
    }
}

