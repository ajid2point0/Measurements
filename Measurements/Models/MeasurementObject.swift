//
//  MeasurementObject.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable {
    
    let id, identifier, name: String
    let unit: String?
    let measurements: [Measurement]
    
}

extension MeasurementObject {
    init(name: String) {
        self.init(
            id: UUID().uuidString,
            identifier: UUID().uuidString,
            name: name,
            unit: "m",
            measurements: [Measurement]()
        )
    }
}

extension MeasurementObject: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case name, unit, measurements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(String.self, forKey: .identifier)
        name = try container.decode(String.self, forKey: .name)
        unit = try container.decodeIfPresent(String.self, forKey: .unit)
        measurements = try container.decode([Measurement].self, forKey: .measurements)
        id = UUID().uuidString
    }
}

extension MeasurementObject: Equatable {
    static func == (lhs: MeasurementObject, rhs: MeasurementObject) -> Bool {
        lhs.id == rhs.id
    }
}
