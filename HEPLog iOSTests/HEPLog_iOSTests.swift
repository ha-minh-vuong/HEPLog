//
// Copyright © 2017 by Ha Minh Vuong.
//


import XCTest

@testable import HEPLog

var logger: HEPLog?

class HEPLog_iOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLog() {
        logger = HEPLog()

        let stdOutLog = HEPConsoleLog()
        stdOutLog.logLevel = .trace
        logger?.add(logger: stdOutLog)
        logger?.trace("a b c")
        logger?.debug()
        logger?.info()
        logger?.warn()
        logger?.error()
        logger?.fatal()
    }

    func testLogFormat() {
        HEPModuleLog.enable = true
        logger = HEPModuleLog.log
        let stdOutLog = HEPConsoleLog()
        stdOutLog.formatter = "{{type}} a b c {{file}} {{message}} d e f {{line}} {{function}} {{TYPE}}"
        stdOutLog.logLevel = .trace
        logger?.add(logger: stdOutLog)
        logger?.trace("this a verbose message")
        logger?.debug("this a debug message")
        logger?.info("this a info message")
        logger?.warn("this a warn message")
        logger?.error("this a error message")
        logger?.fatal("this a fatal message")
    }

    func testLogDefaultFormat() {
        HEPModuleLog.enable = true
        logger = HEPModuleLog.log
        let stdOutLog = HEPConsoleLog()
        stdOutLog.logLevel = .trace
        logger?.add(logger: stdOutLog)
        logger?.trace("this a verbose message")
        logger?.debug("this a debug message")
        logger?.info("this a info message")
        logger?.warn("this a warn message")
        logger?.error("this a error message")
        logger?.fatal("this a fatal message")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
