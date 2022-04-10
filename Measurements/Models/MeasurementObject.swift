//
//  MeasurementObject.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable, Codable {
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
