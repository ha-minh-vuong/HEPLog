//
// Copyright © 2017 by Ha Minh Vuong.
//

enum FormatVariable: String {
    case TYPE, type, file, line, function, message
}

final class HEPLogFormatter {
    static func render(format: String, variables: [FormatVariable: String]) -> String {
        var result = format
        variables.forEach { entry in
            result = result.replacingOccurrences(of: "{{\(entry.key)}}", with: entry.value)
        }
        return result
    }
}
