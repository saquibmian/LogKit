//
//  LogWriter.swift
//  LogKit.CLI
//
//  Created by Saquib Mian on 2016-02-25.
//  Copyright © 2016 Saquib Mian. All rights reserved.
//

public protocol LogWriter {
    func writeLog(log: String)
}

public struct StandardOutLogWriter : LogWriter {
    public func writeLog(log: String) {
        print(log)
    }
}

public struct StandardErrorLogWriter : LogWriter {
    public func writeLog(log: String) {
        print(log)
    }
}
