//
//  Measurement.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import Foundation

struct Coordinate: Decodable {
    let latitude: Double
    let longitude: Double
}

struct Measurement: Decodable, Identifiable {
    let id: String
    let timeStamp: Int
    let value: MeasurementValue
    
    var time: Date {
        let timeInterval = Double(timeStamp)
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    // measurement are either single(String, float) or tuple(location)
    enum MeasurementValue: Decodable {
        case SingleValue(String)
        case Tuple(Double, Double)
    }
}
extension Measurement {
    
    init(timeStamp: Int, value: MeasurementValue) {
        self.timeStamp = timeStamp
        self.value = value
        self.id = String(timeStamp)
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        timeStamp = try container.decode(Int.self)
        id = String(timeStamp)
        do {
            value = try .SingleValue(container.decode(String.self))
        } catch {
            do {
                let doubleValue = try container.decode(Double.self)
                value = .SingleValue(String(doubleValue))
            } catch {
                do {
                    let array = try container.decode([Double].self)
                    if array.count >= 2 {
                        value = .Tuple(array[0], array[1])
                    } else {
                        throw DecodingError.typeMismatch(MeasurementValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Couldn't convert array into tuple"))
                    }
                } catch {
                    throw DecodingError.typeMismatch(Measurement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload conflicts with expected type"))
                }
            }
        }
    }
}
