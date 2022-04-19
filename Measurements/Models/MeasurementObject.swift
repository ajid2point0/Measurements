//
//  MeasurementObject.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable, Decodable {
    
    let id = UUID().uuidString
    let identifier, name: String
    let unit: String?
    let measurements: [Measurement]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case name, unit, measurements
    }
    
}

extension MeasurementObject: Equatable {
    static func == (lhs: MeasurementObject, rhs: MeasurementObject) -> Bool {
        lhs.id == rhs.id
    }
}
