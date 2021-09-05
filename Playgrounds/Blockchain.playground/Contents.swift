// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Simple implementation of a cryptocurrency using blockchain.
//

import Foundation
import UIKit
import CommonCrypto

/// Simple transaction.
struct Transaction: Codable {
    let sender: String
    let recipient: String
    let amount: Int
}

/// Simple block.
struct Block: Codable {
    let proof: Int
    let index: Int
    let timestamp: Date
    let transactions: [Transaction]
    let previousHash: Data
    
    func hash() -> Data {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(self)
        return data.sha256()
    }

    func description() -> String {
        let json = try! JSONEncoder().encode(self)
        return String(data: json, encoding: .utf8)!
    }
}

extension Data {
    func sha256() -> Data {
        guard let result = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH)) else {
            fatalError("Failed to create SHA256 Digest.")
        }
        CC_SHA256((self as NSData).bytes, CC_LONG(self.count), result.mutableBytes.assumingMemoryBound(to: UInt8.self))
        return result as Data
    }
    
    func hexDigest() -> String {
        return self.map({String(format: "%02x", $0)}).joined()
    }
}

/// Simple blockchain class.
class Blockchain {
    /// Initial empty list of transactions.
    private var currentTransactions = [Transaction]()
    
    /// Initial empty list of blocks in the blockchain.
    var chain = [Block]()
    
    init() {
        addBlock(proof: 10, previousHash: "1".data(using: .utf8))
    }
    
    /// Get the last block in the chain.
    ///
    /// - Returns: Last block in the chain.
    func lastBlock() -> Block {
        guard let block = chain.last else {
            fatalError("Chain should at least have one block created during init.")
        }
        return block
    }
    
    /// Creates and add block to chain.
    ///
    /// - Parameters:
    ///   - proof: Block proof.
    ///   - previousHash: Block previous hash.
    /// - Returns: Block created and added to the chain.
    @discardableResult func addBlock(proof: Int, previousHash: Data? = nil) -> Block {
        let hash: Data
        if let previousHash = previousHash {
            hash = previousHash
        } else {
            hash = lastBlock().hash()
        }
        
        let block = Block(proof: proof,
                          index: (chain.count + 1),
                          timestamp: Date(),
                          transactions: currentTransactions,
                          previousHash: hash)
        
        currentTransactions = []
        
        chain.append(block)
        
        return block
    }
    
    /// Creates and add transaction.
    ///
    /// - Parameters:
    ///   - sender: Name of sender.
    ///   - recipient: Name of recipient.
    ///   - amount: Transaction amount.
    /// - Returns: Index of the block that will hold this transaction.
    @discardableResult func addTransactions(sender: String, recipient: String, amount: Int) -> Int {
        let transaction = Transaction(sender: sender, recipient: recipient, amount: amount)
        currentTransactions.append(transaction)
        return lastBlock().index + 1
    }
    
    // Simple Proof of Work algorithm.
    
    /// Validates the proof.
    ///
    /// - Parameters:
    ///   - lastProof: Previous proof.
    ///   - proof: Current proof.
    /// - Returns: (true) if hash(lastProof, proof) contains 4 leading zeroes. (false) otherwise.
    class func validProof(lastProof: Int, proof: Int) -> Bool {
        guard let guess = String("\(lastProof)\(proof)").data(using: .utf8) else {
            fatalError("Unable to convert lastProof and proof into UTF8 data")
        }
        let guess_hash = guess.sha256().hexDigest()
        print("validProof guess_hash = \(guess_hash)")
        return guess_hash.prefix(2) == "00"
    }
    
    /// Find a proof that is a valid proof.
    ///
    /// - Parameter lastProof: Previous proof.
    /// - Returns: Valid proof.
    class func proofOfWork(lastProof: Int) -> Int {
        print("proofOfWork lastProof = \(lastProof)")
        var proof: Int = 0
        while !validProof(lastProof: lastProof, proof: proof) {
            print("proofOfWork proof = \(proof)")
            proof += 1
        }
        return proof
    }
}

/// Simple blockchain server.
class BlockchainServer {
    let blockchain = Blockchain()
    
    /// Creates and add a new transaction into the blockchain transactions.
    ///
    /// - Parameters:
    ///   - sender: Sender name.
    ///   - recipient: Recipient name.
    ///   - amount: Block amount.
    /// - Returns: Index of the block that will hold this transaction.
    func send(sender: String, recipient: String, amount: Int) -> Int {
        return blockchain.addTransactions(sender: sender, recipient: recipient, amount:amount)
    }
    
    func createBlockWithTransactions(proof: Int) {
        blockchain.addBlock(proof: proof)
    }
    
    /// Mines for coins.
    ///
    /// - Parameters:
    ///   - recipient: Recipient name.
    ///   - completion: Optional closure with the new block.
    func mine(recipient: String, completion: ((Block) -> Void)?) {
        DispatchQueue.global(qos: .default).async {
            // Run proof of work algorithm to find the next proof.
            let lastProof = self.blockchain.lastBlock().proof
            let proof = Blockchain.proofOfWork(lastProof: lastProof)
            
            // Receive a reward for finding the proof.
            // The sender is "0" to signify that this block has mined a new coin.
            self.blockchain.addTransactions(sender: "0", recipient: recipient, amount: Int.random(in: 1...100))
            
            // Create and add the new block to the chain.
            let block = self.blockchain.addBlock(proof: proof)
            
            DispatchQueue.main.async {
                completion?(block)
            }
        }
    }
    
    /// Access the blockchain.
    ///
    /// - Returns: Array of blocks in blockchain.
    func chain() -> [Block] {
        return blockchain.chain
    }
}

// Test the blockchain implementation by mining for coins!

let server = BlockchainServer()

func updateChain() {
    let chain = server.chain()
    var text = "chain:\n"
    for block in chain {
        text.append(block.description() + "\n")
    }
    print("\(#function) --> \(text)")
}

func sendTransaction(amount: Int) {
    let index = server.send(sender: "me", recipient: "someone", amount: amount)
    print("Transaction added to block \(index)")
    updateChain()
}

func mineForCoin(completion: ((Block) -> Void)?) {
    let startTime = CACurrentMediaTime()
    print("Mining ...")
    
    server.mine(recipient: "me") { (block) in
        print("***** New block forged, it took \(CACurrentMediaTime() - startTime) seconds")
        print("\(block.description())")
        updateChain()
        completion?(block)
    }
}

updateChain()

sendTransaction(amount: 3)
sendTransaction(amount: 5)
sendTransaction(amount: 1)

//server.createBlockWithTransactions(proof: 9)
//
//sendTransaction(amount: 22)
//sendTransaction(amount: 99)
//
//server.createBlockWithTransactions(proof: 8)

mineForCoin { (block) in
    mineForCoin { (block) in
        mineForCoin { (block) in
        
        }
    }
}

