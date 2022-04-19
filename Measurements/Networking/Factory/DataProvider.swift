//
//  DataProvider.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 18/4/2022.
//

import Foundation
import Combine

protocol DataProvider: Publisher where Failure == Error, Output == Data {}
