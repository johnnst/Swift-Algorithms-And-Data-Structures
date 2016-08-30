// John Ngoi
// Shortest Path using Dijkstra's algorithm
// Given a directed graph, find the shortest path distance between two vertices
//

class Vertex {
    var key: String?
    var neighbors: [Edge]
    // special distance tracker
    var distance = 0
    
    init () {
        self.neighbors = [Edge]()
    }
    
    init (key: String) {
        self.key = key
        self.neighbors = [Edge]()
    }
}

class Edge {
    var neighbor: Vertex
    var weight: Int
    
    init () {
        self.weight = 0
        self.neighbor = Vertex()
    }
}

class Graph {
    
    var canvas: [Vertex]
    var isDirected: Bool
    
    init() {
        self.canvas = [Vertex]()
        self.isDirected = true
    }
    
    func addVertex (key: String) -> Vertex {
        // create a vertex with the key
        let childVertex: Vertex = Vertex(key: key)
        
        // add vertex to graph canvas
        canvas.append(childVertex)
        return childVertex
    }
    
    func addEdge (source: Vertex, neighbor: Vertex, weight: Int) {
        // create a new edge
        let newEdge = Edge()
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        // check for undirected graph
        if isDirected == false {
            // create a reverse edge
            let reverseEdge = Edge()
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
    }
    
    func shortestPathCost (from: Vertex, to: Vertex) -> Int {
        // first, set all the distance to max
        for v in self.canvas {
            v.distance = Int.max
        }
        
        // set the starting node distance to 0
        from.distance = 0
        
        var queue = [Vertex]() // magic sauce
        queue.append(from) // enqueue
        
        while queue.isEmpty == false {
            let vertex = queue.removeFirst() // dequeue
            
            // scan the edges
            for edge in vertex.neighbors {
                let updatedDistance = edge.weight + vertex.distance
                if updatedDistance < edge.neighbor.distance {
                    edge.neighbor.distance = updatedDistance // update the distance value with the lowest found
                }
                queue.append(edge.neighbor) // enqueue
            }
        }
        return to.distance
    }
}

// let's test!
let graph = Graph()
let vertex1 = graph.addVertex("G")
let vertex2 = graph.addVertex("H")
let vertex3 = graph.addVertex("A")
let vertex4 = graph.addVertex("C")
let vertex5 = graph.addVertex("Z")
graph.addEdge(vertex1, neighbor: vertex2, weight: 5)
graph.addEdge(vertex1, neighbor: vertex3, weight: 1)
graph.addEdge(vertex1, neighbor: vertex5, weight: 11)
graph.addEdge(vertex2, neighbor: vertex4, weight: 1)
graph.addEdge(vertex4, neighbor: vertex5, weight: 2)

let result = graph.shortestPathCost(vertex1, to: vertex5) // returns 8
// there are two paths to "Z", one cost 8, one cost 11



