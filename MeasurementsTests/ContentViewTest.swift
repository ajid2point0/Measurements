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

extension MeasurementRow: Inspectable {}

extension Inspection: InspectionEmissary { }

class ContentViewTest: XCTestCase {

    private var sut: ContentView!

    override func setUp() {
        super.setUp()
        let presenter = Presenter(networking: NetworkingMock())
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
        
        let exp = sut.inspection.inspect { view in
            let list = try view.find(ViewType.List.self)
            
            XCTAssertFalse(try list.find(MeasurementRow.self).isAbsent, "MeasurementRow should exist")
        }
        
        wait(for: [exp], timeout: 0.1)
        
    }

    func test_List_rowsNumber_shouldReturnFour() throws {
        
        let exp = sut.inspection.inspect { view in
            let list = try view.find(ViewType.List.self)
            let views = list.findAll(MeasurementRow.self)
            
            XCTAssertEqual(views.count, 4, "number of Measurements rows in list")
        }
        
        wait(for: [exp], timeout: 0.1)
        
    }

    func test_listFirstRowText_shouldGreetJack() throws {
        
        let exp = sut.inspection.inspect { view in
            let list = try view.find(ViewType.List.self)
            let row = try list.find(MeasurementRow.self)
            
            XCTAssertEqual(try row.text().string(), "measurement4")
        }
        
        wait(for: [exp], timeout: 0.1)
        
    }
}
