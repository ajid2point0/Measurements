//
//  EventParser.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 18/4/2022.
//

import Foundation

struct EventParser {

    static func parse(_ eventString: String) -> (key: String?, value: String?) {
        
        var key, value: String?
        let validNewlineCharacters = ["\r\n", "\n", "\r"]
        let scanner = Scanner(string: eventString)
        
        key = scanner.scanUpToString(":")
        _ = scanner.scanString(":")
        for newLine in validNewlineCharacters {
            if let line = scanner.scanUpToString(newLine) {
                value = line
                break
            }
        }
        if key != "event" && value == nil {
            value = ""
        }
        return (key, value)
    }

}
