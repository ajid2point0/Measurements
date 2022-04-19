//
//  MeasurementsApp.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

@main
struct MeasurementsApp: App {
    
    @StateObject var presenter = Presenter(dataFactory: APIDataFactory())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(presenter)
        }
    }
}
