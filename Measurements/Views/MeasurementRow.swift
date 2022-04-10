//
//  MeasurementRow.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import SwiftUI

struct MeasurementRow: View {
    
    let greeting: String
    
    var body: some View {
        Text(greeting)
    }
}

struct MeasurementRow_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementRow(greeting: "Hello, World!")
            .previewLayout(.sizeThatFits)
    }
}
