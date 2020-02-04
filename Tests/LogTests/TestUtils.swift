import XCTest
import Foundation

func XCTAssertDumpsEqual<T>(_ lhs: @autoclosure () -> T,
                                   _ rhs: @autoclosure () -> T,
                                   message: @autoclosure () -> String = "Expected dumps to be equal.",
                                   file: StaticString = #file,
                                   line: UInt = #line) {
    XCTAssertEqual(String(dumping: lhs()), String(dumping: rhs()), message(), file: file, line: line)
}


extension String {

    /// Returns the receiver casted to an `NSString`
    var nsString: NSString {
        return self as NSString
    }
}

extension String {

    /// Creates a string from the `dump` output of the given value.
    init<T>(dumping x: T) {
        self.init()
        dump(x, to: &self)
    }
}
