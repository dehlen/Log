import XCTest
@testable import Log

class DummyLoggerTestCase: XCTestCase {

    func testLog() {
        let log = Log.DummyLogger()

        log.log(level: .verbose, message: "message", file: "filename.ext", line: 1337, function: "function")
    }
}
