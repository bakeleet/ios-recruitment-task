//
//  DLog.swift
//  Recruitment-iOS
//
//  Created by Krzysztof Niestrój on 08/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import Foundation

class Logger {
    static func DLog(message: String,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line,
                     column: Int = #column) {
        print("[DEBUG] \(file) : \(function) : \(line) : \(column) - \(message)")
    }
}
