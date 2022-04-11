//
//  MeasurementObject.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

struct MeasurementObject: Identifiable, Decodable {
    let id, name: String
    let unit: String?
    let measurements: [Measurement]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, unit, measurements
    }
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
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        unit = try container.decodeIfPresent(String.self, forKey: .unit)
        measurements = try container.decode([Measurement].self, forKey: .measurements)
    }
}
