//
// Copyright © 2017 by Ha Minh Vuong.
//

public final class HEPLog {
    private var loggers: [HEPLoggable] = []

    public init() {}

    // MARK: - Loggers

    public func add(logger: HEPLoggable) {
        loggers.append(logger)
    }

    public func removeLogger(at: Int) {
        loggers.remove(at: at)
    }

    public func removeAllLogger() {
        loggers.removeAll()
    }

    // MARK: - Log method

    public func trace(_ message: String = "", functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        loggers.forEach { logger in
            logger.log(.trace, message: message, functionName: functionName, lineNum: lineNum, fileName: fileName)
        }
    }

    public func debug(_ message: String = "", functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        loggers.forEach { logger in
            logger.log(.debug, message: message, functionName: functionName, lineNum: lineNum, fileName: fileName)
        }
    }

    public func info(_ message: String = "", functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        loggers.forEach { logger in
            logger.log(.info, message: message, functionName: functionName, lineNum: lineNum, fileName: fileName)
        }
    }

    public func warn(_ message: String = "", functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        loggers.forEach { logger in
            logger.log(.warn, message: message, functionName: functionName, lineNum: lineNum, fileName: fileName)
        }
    }

    public func error(_ message: String = "", functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        loggers.forEach { logger in
            logger.log(.error, message: message, functionName: functionName, lineNum: lineNum, fileName: fileName)
        }
    }

    public func fatal(_ message: String = "", functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        loggers.forEach { logger in
            logger.log(.fatal, message: message, functionName: functionName, lineNum: lineNum, fileName: fileName)
        }
    }
}
