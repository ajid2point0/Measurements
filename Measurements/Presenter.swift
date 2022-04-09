//
//  Presenter.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 9/4/2022.
//

protocol Presentable {
    associatedtype Presentee
}

struct Presenter: Presentable {
    typealias Presentee = [Measurement]
    let presentee: Presentee
}
