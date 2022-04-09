//
//  ContentView.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

struct ContentView: View {
    let presenter: Presenter
    var body: some View {
        NavigationView{
            List(presenter.presentee) {
                MeasurementRow(greeting: $0.name)
            }
            .navigationTitle("Measurement")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            presenter: Presenter(
                presentee: [
                    MeasurementObject(name: "Hi, Mike")
                ]
            )
        )
    }
}
