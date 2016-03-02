//
//  LogMessage.swift
//  LogKit.CLI
//
//  Created by Saquib Mian on 2016-02-25.
//  Copyright © 2016 Saquib Mian. All rights reserved.
//

import Foundation

struct LogMessageInfo {
    let level: LogLevel
    let timestamp: NSDate
    let file: String
    let line: Int
}

struct LogMessage {
    let message: String
    let info: LogMessageInfo
}

// maybe FormattingContext?
public protocol CustomLogFormattable {
    func format(level: LogLevel) -> String
}