// John Ngoi
// Depth First Search (DFS)
// Simple implementation of DFS
// Given a directed graph, find the farthest node from a given node.
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

// find farthest node using DFS
func dfs (from: Node) -> (Int, Node) {
    var stack = [Node]() // the magic sauce
    stack.append(from) // push
    
    var longest = 0
    var farthestNode = from
    
    while stack.isEmpty == false {
        let node = stack.removeLast() // pop
        
        for neighbor in node.neighbors {
            neighbor.visited = true
            neighbor.steps = node.steps + 1
            
            if neighbor.steps > longest {
                longest = neighbor.steps
                farthestNode = neighbor
            }
            
            stack.append(neighbor) // push
        }
    }
    
    return (longest, farthestNode)
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

let result = dfs(node1) // returns 4, node9


