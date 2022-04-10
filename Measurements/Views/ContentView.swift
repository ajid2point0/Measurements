//
//  ContentView.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

struct ContentView: View {
    let presenter: Presenter
    let network = Networking()
    var body: some View {
        List(presenter.presentee) {
            MeasurementRow(greeting: $0.name)
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
