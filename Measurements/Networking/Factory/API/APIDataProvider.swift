//
//  APIDataProvider.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 18/4/2022.
//

import Foundation
import Combine

class APIDataProvider: NSObject {
    
    private var subject = PassthroughSubject<Data, Error>()
    
    private lazy var operationQueue: OperationQueue = {
        let opeQ = OperationQueue()
        opeQ.maxConcurrentOperationCount = 1
        return opeQ
    }()

    private lazy var urlSession: URLSession = {
        URLSession(configuration: .default, delegate: self, delegateQueue: operationQueue)
    }()

    init(_ endPoint: EndPoint) {
        super.init()
        guard let url = URL.from(endPoint) else {
            subject.send(completion: .failure(URLError(.badURL)))
            return
        }
        urlSession.dataTask(with: url).resume()
    }
    
}

extension APIDataProvider: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        subject.send(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            subject.send(completion: .failure(error))
        } else {
            subject.send(completion: .finished)
        }
    }
    
}

extension APIDataProvider: DataProvider {
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Data == S.Input {
        subject.receive(subscriber: subscriber)
    }
}
