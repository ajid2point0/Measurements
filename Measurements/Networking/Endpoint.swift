//
//  Endpoint.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 10/4/2022.
//

import Foundation

public enum Method : String {
    case post = "POST"
    case get = "GET"
}

protocol EndPointProtocol {
    
    // Example: "https"
    var scheme: String { get }
    
    var host: String { get }
    
    var path: String { get }
    
    var port: Int { get }
    
    var headers: [String: String]? { get }
    
    // Example: .get
    var method: Method { get }
}

enum Endpoint {
    case DemoSSE
}

extension Endpoint: EndPointProtocol {
    
    var scheme: String { "http"}
    
    var host: String { "wsdemo.envdev.io" }
    
    var path: String { "/sse" }
    
    var port: Int { 80 }
    
    var headers: [String: String]? { nil }
    
    var method: Method { .get }
    
}
