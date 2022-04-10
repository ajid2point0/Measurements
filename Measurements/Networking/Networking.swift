//
//  Networking.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation
import Combine

class Networking {
    var serverEvents: ServerEvents?
    var cancelables = Set<AnyCancellable>()
    init() {
        let endpoint = Endpoint.DemoSSE
        guard let serverURL = URL.from(endpoint) else {return}
        serverEvents = ServerEvents(url: serverURL, headers: endpoint.headers, payload: nil, method: .get)
        serverEvents?.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished: print("Finished")
                case .failure(let error): print(error)
                }
            }
        )
        { print($0) }
            .store(in: &cancelables)
    }
}
