// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Breadth First Search (BFS)
// Simple implementation of BFS
// Given a graph of nodes (directed), find the number of nodes it will take from one node to another, do not count the starting node
//

class Node {
    var visited = false
    var data: Int
    var neighbors = [Node]()
    // special to count the steps
    var steps = 0
    
    init (data: Int) {
        self.data = data
    }
}

func bfs(from: Node, to: Node) -> Int {
    var queue = [Node]() // the magic sauce
    queue.append(from) // enqueue
    
    while queue.isEmpty == false { // more magic here
        let node = queue.removeFirst() // dequeue
        
        for neighbor in node.neighbors {
            if neighbor.visited == false {
                neighbor.visited = true
                neighbor.steps = node.steps + 1
                
                if neighbor.data == to.data {
                    return neighbor.steps // found the destination
                }
                
                queue.append(neighbor) // enqueue
            }
        }
    }
    return 0
}

// let's test!
let node1 = Node(data: 1)
let node2 = Node(data: 2)
let node3 = Node(data: 3)
let node4 = Node(data: 4)
let node5 = Node(data: 5)
let node6 = Node(data: 6)
let node7 = Node(data: 7)
let node8 = Node(data: 8)
let node9 = Node(data: 9)

// create a graph
node1.neighbors.append(node3)
node1.neighbors.append(node4)
node3.neighbors.append(node5)
node3.neighbors.append(node2)
node3.neighbors.append(node6)
node2.neighbors.append(node5)
node5.neighbors.append(node7)
node6.neighbors.append(node8)
node8.neighbors.append(node9)

// can you visualize the above graph? See Appendix A.
// Hint: It's OK to use a pen and paper to draw this out!

let result = bfs(from: node1, to: node7) // returns 3
