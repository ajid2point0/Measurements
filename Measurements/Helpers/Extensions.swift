//
//  Extensions.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

extension URL {
    static func from(_ endPoint: EndPointProtocol) -> URL? {
        var comp = URLComponents()
        comp.scheme = endPoint.scheme
        comp.host = endPoint.host
        comp.path = endPoint.path
        comp.port = endPoint.port
        return comp.url
    }
}
