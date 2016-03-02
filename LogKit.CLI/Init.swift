//
//  Init.swift
//  LogKit.CLI
//
//  Created by Saquib Mian on 2016-02-25.
//  Copyright © 2016 Saquib Mian. All rights reserved.
//

private var instance: LoggerType = NullLogger()

public func initLogging(withConfiguration config: LoggingConfiguration) {
    guard instance.dynamicType == NullLogger.self else {
        fatalError("logging has already been initialized")
    }
    instance = DefaultLogger(config: config, StandardOutLogWriter())
}

public func initLogging(withConfiguration config: LoggingConfiguration, andWriter writer: LogWriter) {
    guard instance.dynamicType == NullLogger.self else {
        fatalError("logging has already been initialized")
    }
    instance = DefaultLogger(config: config, writer)
}

internal func logger() -> LoggerType {
    return instance
}

private final class NullLogger : LoggerType {
    func log(message: LogMessage) { }
}
