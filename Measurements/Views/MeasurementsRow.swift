//
//  MeasurementsRow.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 13/4/2022.
//

import SwiftUI

struct MeasurementsRow: View {
    
    let measurement: MeasurementObject
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("name: \(measurement.name)")
            ForEach(measurement.measurements, id: \.id) { measurementValue in
                MeasurementRow(measurementValue: measurementValue, unit: measurement.unit)
            }
        }
        .padding([.top, .bottom])
    }
}

struct MeasurementsRow_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementsRow(measurement: MeasurementObject(name: "measurement1"))
            .previewLayout(.sizeThatFits)
    }
}
