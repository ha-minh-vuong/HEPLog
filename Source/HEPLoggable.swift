//
// Copyright © 2017 by Ha Minh Vuong.
//


public enum HEPLogLevel: Int {
    case off
    case trace
    case debug
    case info
    case warn
    case error
    case fatal

    public var name: String {
        switch self {
        case .off:
            return "off"
        case .trace:
            return "trace"
        case .debug:
            return "debug"
        case .info:
            return "info"
        case .warn:
            return "warn"
        case .error:
            return "error"
        case .fatal:
            return "fatal"
        }
    }
}

public protocol HEPLoggable {
    var logLevel: HEPLogLevel { get }
    var formatter: String? { get }
    func log(_ type: HEPLogLevel, message: String, functionName: String, lineNum: Int, fileName: String)
}

extension HEPLoggable {

    public func log(_ type: HEPLogLevel, message: String, functionName: String, lineNum: Int, fileName: String) {

        guard shouldLog(type) else { return }

        var result: String
        let lastPathComponent = (fileName as NSString).lastPathComponent

        if let formatter = formatter {
            let formatVariables = [
                FormatVariable.TYPE: type.name.uppercased(),
                FormatVariable.type: type.name,
                FormatVariable.file: lastPathComponent,
                FormatVariable.line: "\(lineNum)",
                FormatVariable.function: functionName,
                FormatVariable.message: message
            ]
            result = HEPLogFormatter.render(format: formatter, variables: formatVariables)
            
        } else { // Default format
            var msgType: String
            switch type {
            case .off:
                return
            case .trace:
                msgType = "[TRACE]".padding(toLength: 7, withPad: " ", startingAt: 0)
            case .debug:
                msgType = "[DEBUG]".padding(toLength: 7, withPad: " ", startingAt: 0)
            case .info:
                msgType = "[INFO]".padding(toLength: 7, withPad: " ", startingAt: 0)
            case .warn:
                msgType = "[WARN]".padding(toLength: 7, withPad: " ", startingAt: 0)
            case .error:
                msgType = "[ERROR]".padding(toLength: 7, withPad: " ", startingAt: 0)
            case .fatal:
                msgType = "[FATAL]".padding(toLength: 7, withPad: " ", startingAt: 0)
            }
            result = "\(msgType) \(lastPathComponent):\(lineNum) \(functionName)| \(message)"
        }

        print(result, separator: "", terminator: "\n")
    }

    private func shouldLog(_ type: HEPLogLevel) -> Bool {
        return logLevel.rawValue <= type.rawValue
    }
}
