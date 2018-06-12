//
// Copyright © 2017 by Ha Minh Vuong.
//

/// Log to standard output, using default `log(_,message:,functionName:,lineNum:,fileName:)`
/// implementation which in turn using `print()` method.
public final class HEPConsoleLog: HEPLoggable {
    public var logLevel: HEPLogLevel = .off
    public var formatter: String?

    public init() {}
}
