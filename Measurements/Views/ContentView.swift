//
//  ContentView.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var presenter: Presenter
    internal let inspection = Inspection<Self>()
    
    var body: some View {
        NavigationView {
            List(presenter.measurementList) {
                MeasurementsRow(measurement: $0)
            }
            .listStyle(.plain)
            .navigationTitle("MEASUREMENTS")
            .navigationBarTitleDisplayMode(.inline)
            .animation(.easeInOut(duration: 1), value: presenter.measurementList)
            .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Presenter(dataFactory: APIDataFactory()))
    }
}
