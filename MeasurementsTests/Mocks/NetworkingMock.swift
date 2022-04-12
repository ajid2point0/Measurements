//
//  NetworkingMock.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 11/4/2022.
//

import Combine
@testable import Measurements

final class NetworkingMock: NetworkingProtocol {
    
    func getEvents() -> AnyPublisher<[MeasurementObject], Error>? {
        Result.Publisher(
            [
                MeasurementObject(name: "measurement1"),
                MeasurementObject(name: "measurement2"),
                MeasurementObject(name: "measurement3"),
                MeasurementObject(name: "measurement4")
            ]
        )
        .eraseToAnyPublisher()
    }
    
}
