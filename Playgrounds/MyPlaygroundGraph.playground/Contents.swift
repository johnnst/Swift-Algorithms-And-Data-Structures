// John Ngoi
// Graph

/// Simple vertex class.
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

/// Simple edge class.
class Edge {
    var neighbor: Vertex
    var weight: Int
    
    init () {
        self.weight = 0
        self.neighbor = Vertex()
    }
}

/// Simple graph class.
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
}

// test your graph code
let graph = Graph()
let vertex1 = graph.addVertex(key: "G")
let vertex2 = graph.addVertex(key: "H")
let vertex3 = graph.addVertex(key: "A")
let vertex4 = graph.addVertex(key: "C")
let vertex5 = graph.addVertex(key: "Z")
graph.addEdge(source: vertex1, neighbor: vertex2, weight: 5)
graph.addEdge(source: vertex1, neighbor: vertex3, weight: 1)
graph.addEdge(source: vertex1, neighbor: vertex5, weight: 11)
graph.addEdge(source: vertex2, neighbor: vertex4, weight: 1)
graph.addEdge(source: vertex4, neighbor: vertex5, weight: 2)
