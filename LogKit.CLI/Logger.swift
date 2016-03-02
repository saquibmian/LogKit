//
//  Logger.swift
//  LogKit.CLI
//
//  Created by Saquib Mian on 2016-02-25.
//  Copyright © 2016 Saquib Mian. All rights reserved.
//

import Foundation

internal protocol LoggerType {
    //init(config: LoggingConfiguration)
    func log(message: LogMessage)
}

public struct LoggingConfiguration {
    public var minimumLogLevel: LogLevel = .Info
    public var dateStyle: NSDateFormatterStyle = .ShortStyle
    public var timeStyle: NSDateFormatterStyle = .ShortStyle
    public var logSourceCodeInformation: Bool = true
}

internal final class DefaultLogger : LoggerType {
    
    private let config: LoggingConfiguration
    private let formatter = NSDateFormatter()
    
    internal var writer: LogWriter
    
    internal init(config: LoggingConfiguration, _ writer: LogWriter) {
        self.config = config
        self.writer = writer
        
        formatter.dateStyle = config.dateStyle
        formatter.timeStyle = config.timeStyle
    }
    
    internal func log(message: LogMessage) {
        guard message.info.level.rawValue >= config.minimumLogLevel.rawValue else {
            return
        }
        
        var logEntities = [String]()
        
        logEntities.append(formatter.stringFromDate(message.info.timestamp))
        logEntities.append(message.info.level.description)
        if config.logSourceCodeInformation {
            logEntities.append("(\(message.info.file):\(message.info.line))")
        }
        logEntities.append(message.message)
        
        let line = logEntities.filter({ !$0.isEmpty }).joinWithSeparator(" ")
        writer.writeLog(line)
    }
}

