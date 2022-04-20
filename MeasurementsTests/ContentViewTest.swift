//
//  ContentViewTest.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import Measurements

extension ContentView: Inspectable {}

extension MeasurementsRow: Inspectable {}

extension Inspection: InspectionEmissary { }

class ContentViewTest: XCTestCase {

    private var sut: ContentView!

    override func setUp() {
        super.setUp()
        let presenter = Presenter(dataFactory: LocalDataFactory())
        sut = ContentView()
        ViewHosting.host(view: sut.environmentObject(presenter))
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ContentView_hasList() {
        
        let exp = sut.inspection.inspect { view in
            XCTAssertNoThrow(try view.find(ViewType.List.self), "Measurements List should exist")
        }
        
        wait(for: [exp], timeout: 0.1)
        
    }
    
    func test_List_hasMeasurementsRow() throws {
        // TODO: remove GCD call
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let exp = self.sut.inspection.inspect { view in
                let list = try view.find(ViewType.List.self)
                
                XCTAssertFalse(try list.find(MeasurementsRow.self).isAbsent, "MeasurementRow should exist")
            }
            
            self.wait(for: [exp], timeout: 0.1)
        }
    }

    func test_List_rowsNumber_shouldReturn1() throws {
        // TODO: remove GCD call
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let exp = self.sut.inspection.inspect { view in
                let list = try view.find(ViewType.List.self)
                let views = list.findAll(MeasurementsRow.self)
                
                XCTAssertEqual(views.count, 1, "number of Measurements rows in list")
            }
            
            self.wait(for: [exp], timeout: 0.1)
        }
    }

    func test_listFirstRowName_shouldBePressure() throws {
        // TODO: remove GCD call
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let exp = self.sut.inspection.inspect { view in
                let list = try view.find(ViewType.List.self)
                let row = try list.find(MeasurementsRow.self)
                
                XCTAssertEqual(try row.text().string(), "Pressure")
            }
            
            self.wait(for: [exp], timeout: 0.1)
        }
        
    }
}
