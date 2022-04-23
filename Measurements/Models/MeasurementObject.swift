//
//  MeasurementObject.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable {
    
    let id = UUID().uuidString
    let identifier, name: String
    let unit: String?
    let measurements: [Measurement]
    
}

extension MeasurementObject: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case name, unit, measurements
    }
    
    init(name: String, unit: String?) {
        self.identifier = id
        self.name = name
        self.unit = unit
        self.measurements = []
    }
}

extension MeasurementObject: Equatable {
    static func == (lhs: MeasurementObject, rhs: MeasurementObject) -> Bool {
        lhs.id == rhs.id
    }
}
