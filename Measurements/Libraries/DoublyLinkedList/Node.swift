//
//  Node.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 11/4/2022.
//

import Foundation

class Node<T: Equatable>: Equatable {
    var value: T
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init(value: T) {
        self.value = value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
