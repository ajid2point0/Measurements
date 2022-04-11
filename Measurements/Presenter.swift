//
//  Presenter.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 9/4/2022.
//

import Combine

class Presenter: ObservableObject {
    
    private var linkedList = DoublyLinkedList<MeasurementObject>()
    
    private var cancelables = Set<AnyCancellable>()
    @Published var measurementList: [MeasurementObject] = []
    private var networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
        getMeasurements()
    }
    
    private func getMeasurements() {
        networking.getEvents()?.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error): print(error.localizedDescription)
            case .finished: print("Finished")
            }
        }, receiveValue: { [weak self] in
            self?.updateItemList(with: $0)
        }).store(in: &cancelables)
    }
    
    private func updateItemList(with values: [MeasurementObject]) {
        linkedList.prepend(contentOf: values)
        linkedList.removeAll(until: 6)
        let items = linkedList.items()
        self.measurementList = items
    }
    
    deinit {
        cancelables.removeAll()
    }
}
