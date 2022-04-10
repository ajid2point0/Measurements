//
//  Measurement.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import Foundation

struct Measurement: Codable {
    
    let timeStamp: Int
    let value: MeasurementValue
    
    enum MeasurementValue: Codable {
        case SingleValue(String)
        case ListValue([Double])
    }
    
}
extension Measurement {
    init() {
        self.init(
            timeStamp: 12345678,
            value: .SingleValue("MeasurementValue")
        )
    }
}
