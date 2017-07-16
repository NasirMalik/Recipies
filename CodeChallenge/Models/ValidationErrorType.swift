import Foundation

struct ValidationError: Error {
    
    public let message: String
    
    public init(message m: String) {
        message = m
    }
}


