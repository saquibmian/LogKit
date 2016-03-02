//
//  LogLevel.swift
//  LogKit.CLI
//
//  Created by Saquib Mian on 2016-02-25.
//  Copyright © 2016 Saquib Mian. All rights reserved.
//

public enum LogLevel : Int, CustomStringConvertible {
    case Debug = 0
    case Info
    case Warning
    case Error
    case Fatal
    
    public var description: String {
        switch self {
        case .Debug:
            return "DEBUG"
        case .Info:
            return "INFO"
        case .Warning:
            return "WARNING"
        case .Error:
            return "ERROR"
        case .Fatal:
            return "FATAL"
        }
    }
}
