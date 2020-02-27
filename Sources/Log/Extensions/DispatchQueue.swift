import Foundation

extension DispatchQueue {
    static let labelPrefix = "com.davidehlen.Log"
}

public extension DispatchQueue {
    /// A configured queue for executing logger related work items.
    static let logger = DispatchQueue(label: "\(DispatchQueue.labelPrefix).logger", qos: .utility)
}
