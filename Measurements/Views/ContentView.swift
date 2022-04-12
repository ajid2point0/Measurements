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
        List(presenter.measurementList) {
            MeasurementRow(greeting: $0.name)
        }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Presenter(networking: Networking()))
    }
}
