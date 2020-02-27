import Foundation

public struct LogProvider: LogProviderType {
    private let stores: [LogStore]
    
    public init(stores: [LogStore]) {
        self.stores = stores
    }
}

public extension LogProvider {
    func write(_ level: LogAPI.Level, with message: String, path: String, function: String, line: Int, context: [String: CustomStringConvertible]?, completion: (() -> Void)?) {
        let destinations = stores.filter { $0.canWrite(for: level) }
        
        // Skip if does not meet minimum log level
        guard !destinations.isEmpty else {
            completion?()
            return
        }
        
        DispatchQueue.logger.async {
            destinations.forEach {
                $0.write(level, with: message, path: path, function: function, line: line, context: context)
            }
            
            completion?()
        }
    }
}
