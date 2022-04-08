//
//  ContentView.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

protocol Presentable {
    func presentGreetings() -> [Measurement]
}

struct Presenter: Presentable {
    func presentGreetings() -> [Measurement] {
        [
            Measurement(name: "Hi, Frank"),
            Measurement(name: "Hi, Mike"),
            Measurement(name: "Hi, Joe")
        ]
    }
}

struct ContentView: View {
    
    let presenter: Presentable
    
    var body: some View {
        NavigationView{
            List(presenter.presentGreetings()) {
                MeasurementRow(greeting: $0.name)
            }
            .navigationTitle("Measurement")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: Presenter())
    }
}
