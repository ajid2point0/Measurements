//
//  APIDataFactory.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 18/4/2022.
//

import Foundation
import Combine

struct APIDataFactory: DataFactory {
    
    func getData(endPoint: Endpoint) -> AnyPublisher<Data, Error> {
        APIDataProvider(endPoint).eraseToAnyPublisher()
    }
}
