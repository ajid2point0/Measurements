//
//  MeasurementsApp.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 9/4/2022.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Measurements

class MeasurementsApp: XCTestCase {
    
    func test_viewInspectorFrameWork() {
        let sut = Text("FrameWork is functional")
        
        XCTAssertEqual(try sut.inspect().text().string(), "FrameWork is functional")
    }
    
}
