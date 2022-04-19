//
//  LocalDataFactory.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 19/4/2022.
//

import Foundation
import Combine
@testable import Measurements

struct LocalDataFactory: DataFactory {
    
    func getData(endPoint: Endpoint) -> AnyPublisher<Data, Error> {
        LocalDataProvider(.DemoSSE).eraseToAnyPublisher()
    }
    
}
