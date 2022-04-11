//
//  Networking.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation
import Combine

class Networking {
    
    private var serverEvents: ServerEvents?
    private var cancelables = Set<AnyCancellable>()
    
    init() { getEvents() }
    
    private var endPoint: Endpoint {
        Endpoint.DemoSSE
    }
    
    private var url: URL? {
        URL.from(endPoint)
    }
    
    private func getEvents() {
        guard let serverURL = url else {return}
        serverEvents = ServerEvents(url: serverURL, headers: endPoint.headers, payload: nil, method: .get)
        
        serverEvents?
            .compactMap { $0.data(using: .utf8) }
            .decode(type: [MeasurementObject].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: print("Finished")
                case .failure(let error): print(error)
                }
            }, receiveValue: { measurements in
                print(measurements)
            })
            .store(in: &cancelables)
    }
    
    deinit {
        cancelables.removeAll()
    }
}
