//
//  DataFactory.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 18/4/2022.
//

import Foundation
import Combine

protocol DataFactory {
    
    func getData(endPoint: Endpoint) -> AnyPublisher<Data, Error>
}
