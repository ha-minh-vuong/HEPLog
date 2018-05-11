//
// Copyright © 2017 by Ha Minh Vuong.
//


protocol HEPModuleLoggable {
    static var log: HEPLog? { get }
    static var enable: Bool { get set }
}

class HEPModuleLog: HEPModuleLoggable {
    private static var _enable = false
    class var enable: Bool {
        get {
            return _enable
        }
        set {
            _enable = newValue
        }
    }

    class var log: HEPLog? {
        return enable ? HEPLog() : nil
    }
}
