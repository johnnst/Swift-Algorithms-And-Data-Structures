//
// John Ngoi
// Swift 3
// Graph
//

class Vertex {
    var key: String
    var edges: [Edge]
    
    init(key: String) {
        self.key = key
        self.edges = [Edge]()
    }
}

class Edge {
    var weight = 0
    var neighbor: Vertex
    
    init(neighbor: Vertex, weight: Int) {
        self.neighbor = neighbor
        self.weight = weight
    }
}

// directed graph
class Graph {
    var canvas: [Vertex]
    var isDirected: Bool
    
    init(isDirected: Bool) {
        self.canvas = [Vertex]()
        self.isDirected = isDirected
    }
    
    func addVertex (key: String) -> Vertex {
        let vertex = Vertex(key: key)
        self.canvas.append(vertex)
        return vertex
    }
    
    func addEdge (source: Vertex, neighbor: Vertex, weight: Int) {
        // create a new edge
        let edge = Edge(neighbor: neighbor, weight: weight)
        source.edges.append(edge)
        
        // check for undirected graph
        if self.isDirected == false {
            // create reverse edge
            let reverseEdge = Edge(neighbor: source, weight: weight)
            neighbor.edges.append(reverseEdge)
        }
    }
}

let graph = Graph(isDirected: true)

let vertex1 = graph.addVertex(key: "J")
let vertex2 = graph.addVertex(key: "T")
let vertex3 = graph.addVertex(key: "Z")
let vertex4 = graph.addVertex(key: "L")
let vertex5 = graph.addVertex(key: "C")
let vertex6 = graph.addVertex(key: "S")

graph.addEdge(source: vertex1, neighbor: vertex2, weight: 5)
graph.addEdge(source: vertex2, neighbor: vertex5, weight: 1)
graph.addEdge(source: vertex5, neighbor: vertex6, weight: 2)

print(graph.canvas.map { $0.key })
