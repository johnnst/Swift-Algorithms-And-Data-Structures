//
// John Ngoi
// Depth First Search (DFS)
// Simple implementation of DFS
// Given a directed graph, find the farthest node from a given node.
//

class Node {
    var isVisited = false
    var data: Int
    var neighbors = [Node]()
    // special to count the steps
    var path = [Node]()
    
    init (data: Int) {
        self.data = data
    }
}

// find farthest node using DFS
func dfs (from: Node) -> [Node]? {
    if from.neighbors.count == 0 {
        from.path.append(from)
        return [from]
    }
    
    var farthest = from
    var stack = [Node]()
    stack.append(from)
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        node.isVisited = true
        node.path.append(node)
        if node.path.count > farthest.path.count {
            farthest = node
        }
        
        for neighbor in node.neighbors {
            if !neighbor.isVisited {
                neighbor.isVisited = true
                neighbor.path.append(contentsOf: node.path)
                stack.append(neighbor)
            }
        }
    }
    return farthest.path
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
let node10 = Node(data: 10)

// create a graph
node1.neighbors.append(node3)
node1.neighbors.append(node4)
node3.neighbors.append(node5)
node3.neighbors.append(node2)
node3.neighbors.append(node6)
node2.neighbors.append(node5)
node5.neighbors.append(node7)
node5.neighbors.append(node10)
node6.neighbors.append(node8)
node8.neighbors.append(node9)
node9.neighbors.append(node10)

// can you visualize the above graph? See Appendix A.
// Hint: It's OK to use a pen and paper to draw this out!

if let result = dfs(from: node1) { // returns 4, node9
    for r in result {
        print(r.data)
    }
}


