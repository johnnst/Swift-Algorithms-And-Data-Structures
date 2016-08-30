// John Ngoi
// Graph

class Vertex {
    var key: String?
    var neighbors: [Edge]
    
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
    
    func shortestPath (from: Vertex, to: Vertex) -> [Vertex]? {
        
        
        
        return nil
    }
}

// test your graph code
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











