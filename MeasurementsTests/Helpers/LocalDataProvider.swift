//
//  LocalDataProvider.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 19/4/2022.
//

import Foundation
import Combine
@testable import Measurements

struct LocalDataProvider: DataProvider {
    
    private var subject = PassthroughSubject<Data, Error>()
    
    init(_ endpoint: Endpoint) {
        if endpoint == .DemoSSE, let data = LocalData.SSE.data(using: .utf8)  {
            subject.send(data)
        }
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Error == S.Failure, Data == S.Input {
        subject.receive(subscriber: subscriber)
    }
    
}
