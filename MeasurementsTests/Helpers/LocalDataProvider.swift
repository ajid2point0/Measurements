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
    
    private let endPoint: EndPoint
    
    init(_ endPoint: EndPoint) {
        self.endPoint = endPoint
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Error == S.Failure, Data == S.Input {
        subject.receive(subscriber: subscriber)
        if endPoint == .DemoSSE, let data = LocalData.SSE.data(using: .utf8)  {
            subject.send(data)
        }
    }
    
}
