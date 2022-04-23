//
//  MeasurementRow.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

struct MeasurementRow: View {
    
    let measurementValue: Measurement
    let unit: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Time: \(measurementValue.time)")
            HStack {
                let unitValue = unit ?? ""
                if case let .SingleValue(value) = measurementValue.value {
                    Text("Measurement: \(value) \(unitValue)")
                        .lineLimit(2)
                }
                if case let .Tuple(longitude, latitude) = measurementValue.value {
                    Text("Coordiantes: (\(longitude) , \(latitude))")
                        .lineLimit(2)
                }
            }
        }
        .padding()
        .background(Color.mint)
        .cornerRadius(5)
    }
}

struct MeasurementRow_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementRow(measurementValue: Measurement(), unit: "m")
            .previewLayout(.sizeThatFits)
    }
}
