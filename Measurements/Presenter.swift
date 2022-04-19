//
//  Presenter.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 9/4/2022.
//

import Combine
import Foundation

class Presenter: ObservableObject {
    
    private var cancelables = Set<AnyCancellable>()
    private let dataFactory: DataFactory
    @Published private(set) var measurementList: [MeasurementObject] = []
    
    init(dataFactory: DataFactory) {
        self.dataFactory = dataFactory
        getMeasurements()
    }
    
    private func getMeasurements() {
        dataFactory.getData(endPoint: .DemoSSE)
            .compactMap({ [weak self] in self?.parsed(data: $0) })
            .decode(type: [MeasurementObject].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error): print(error.localizedDescription)
                case .finished: print("Finished")
                }
            } receiveValue: { [weak self] in
                self?.updateItemList(with: $0)
            }
            .store(in: &cancelables)
    }
    
    deinit {
        cancelables.removeAll()
    }
}


// MARK: - Helpers methods
extension Presenter {
    
    private func parsed(data: Data) -> Data? {
        
        guard let eventString = String(data: data, encoding: .utf8) else { return nil }
        guard let parsedString = EventParser.parse(eventString).value else { return nil }
        return parsedString.data(using: .utf8)
    }
    
    private func updateItemList(with values: [MeasurementObject]) {
        measurementList.insert(contentsOf: values, at: 0)
    }
}
