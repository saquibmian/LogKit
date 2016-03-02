
//3rd march @ 6pm
import Foundation

// Log a string message
public func log(level: LogLevel, _ message: String, file: String = __FILE__, line: Int = __LINE__) {
    logger().log(LogMessage(message: message, info: LogMessageInfo(level: level, timestamp: NSDate(), file: file, line: line)))
}

// Log any message
public func log<T : Any>(level: LogLevel, _ message: T, file: String = __FILE__, line: Int = __LINE__) {
    log(level, "\(message)", file: file, line: line)
}

// Log a custom loggable object
public func log<T : CustomLogFormattable>(level: LogLevel, _ message: T, file: String = __FILE__, line: Int = __LINE__) {
    log(level, message.format(level), file: file, line: line)
}

extension Int : CustomLogFormattable {
    public func format(level: LogLevel) -> String {
        return "\(self)"
    }
}

struct customlogable : CustomLogFormattable {
    func format(level: LogLevel) -> String {
        if level == .Info {
            return "this is a tes"
        }
        return "non-info test"
    }
}

class random {
    func run() {
        log(.Debug, "random")
        log(.Debug, 2)
        log(.Debug, 2.0)
        log(.Warning, customlogable())
        log(.Info, customlogable())
    }
}

initLogging(withConfiguration: LoggingConfiguration())

var foo = random()
foo.run()
