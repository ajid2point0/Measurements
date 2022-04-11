//
//  Measurement.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import Foundation

struct Measurement: Decodable {
    
    let timeStamp: Int
    let value: MeasurementValue
    
    enum MeasurementValue: Codable {
        case StringValue(String)
        case DoubleValue(Double)
        case ListValue([Double])
    }
}
extension Measurement {
    init() {
        self.init(
            timeStamp: 12345678,
            value: .StringValue("MeasurementValue")
        )
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        timeStamp = try container.decode(Int.self)
        do {
            value = try .StringValue(container.decode(String.self))
        } catch {
            do {
                value = try .DoubleValue(container.decode(Double.self))
            } catch {
                do {
                    value = try .ListValue(container.decode([Double].self))
                } catch {
                    throw DecodingError.typeMismatch(Measurement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload conflicts with expected type"))
                }
            }
        }
    }
}
