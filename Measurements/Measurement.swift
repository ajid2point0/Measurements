//
//  Measurement.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable {
    let id, name, unit: String
    let measurement: Measurement
}
extension MeasurementObject {
    init(name: String) {
        self.init(
            id: UUID().uuidString,
            name: name,
            unit: "m",
            measurement: Measurement()
        )
    }
}

struct Measurement {
    let timeStamp: Int
    let value: MeasurementValue
}
extension Measurement {
    init() {
        self.init(
            timeStamp: 12345678,
            value: .SingleValue("MeasurementValue")
        )
    }
}

enum MeasurementValue: Codable {
    case SingleValue(String)
    case ListValue([Double])
}
