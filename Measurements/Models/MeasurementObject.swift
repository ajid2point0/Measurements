//
//  MeasurementObject.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable {
    
    let id, name: String
    let unit: String?
    let measurements: [Measurement]
    
}

extension MeasurementObject {
    init(name: String) {
        self.init(
            id: UUID().uuidString,
            name: name,
            unit: "m",
            measurements: [Measurement]()
        )
    }
}

extension MeasurementObject: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, unit, measurements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        unit = try container.decodeIfPresent(String.self, forKey: .unit)
        measurements = try container.decode([Measurement].self, forKey: .measurements)
    }
}

extension MeasurementObject: Equatable {
    static func == (lhs: MeasurementObject, rhs: MeasurementObject) -> Bool {
        lhs.id == rhs.id
    }
}
