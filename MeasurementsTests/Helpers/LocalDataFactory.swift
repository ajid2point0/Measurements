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
    
    func getData(endPoint: EndPoint) -> AnyPublisher<Data, Error> {
        LocalDataProvider(.DemoSSE).eraseToAnyPublisher()
    }
    
}
