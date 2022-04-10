//
//  Networking.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation
import Combine

class Networking {
    private var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "wsdemo.envdev.io"
        components.path = "/sse"
        components.port = 80
        return components.url
    }
    var serverEvents: ServerEvents?
    var cancelables = Set<AnyCancellable>()
    
    init() {
        guard let serverURL = url else {return}
        serverEvents = ServerEvents(url: serverURL, payload: nil, method: .get)
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
