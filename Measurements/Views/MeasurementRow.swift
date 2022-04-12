//
//  MeasurementRow.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

struct MeasurementRow: View {
    
    let measurement: MeasurementObject
    
    var body: some View {
        VStack {
            Text(measurement.id)
            Text(measurement.name)
            ForEach(measurement.measurements, id: \.id) { measurementValue in
                HStack {
                    Text("TimeStamp: \(measurementValue.timeStamp)")
                    if case let .SingleValue(value) = measurementValue.value {
                        Text("measurement: \(value)")
                    }
                    if case let .Tuple(longitude, latitude) = measurementValue.value {
                        Text("\(longitude) , \(latitude)")
                    }
                    if let unit = measurement.unit {
                        Text(unit)
                    }
                }
            }
        }
    }
}

struct MeasurementRow_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementRow(measurement: MeasurementObject(name: "measurement1"))
            .previewLayout(.sizeThatFits)
    }
}
