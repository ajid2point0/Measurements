//
//  Networking.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation
import Combine

protocol NetworkingProtocol {
    func getEvents() -> AnyPublisher<[MeasurementObject], Error>?
}

class Networking: NetworkingProtocol {
    
    private var serverEvents: ServerEvents?
    
    private var endPoint: Endpoint {
        Endpoint.DemoSSE
    }
    
    private var url: URL? {
        URL.from(endPoint)
    }
    
    func getEvents() -> AnyPublisher<[MeasurementObject], Error>? {
        guard let serverURL = url else {return nil}
        serverEvents = ServerEvents(url: serverURL, headers: endPoint.headers, payload: nil, method: .get)
        return serverEvents?
            .compactMap { $0.data(using: .utf8) }
            .decode(type: [MeasurementObject].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
