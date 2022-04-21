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
    private var presenter: Presenter!

    override func setUp() {
        super.setUp()
        presenter = Presenter(dataFactory: LocalDataFactory())
        sut = ContentView()
        ViewHosting.host(view: sut.environmentObject(presenter))
    }

    override func tearDown() {
        sut = nil
        presenter = nil
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
            
            XCTAssertFalse(try list.find(MeasurementsRow.self).isAbsent, "MeasurementsRow should exist")
        }
        
        wait(for: [exp], timeout: 0.1)
    }

    func test_List_rowsNumber_shouldReturn2() throws {
        let exp = sut.inspection.inspect { view in
            let list = try view.find(ViewType.List.self)
            let views = list.findAll(MeasurementsRow.self)
            
            XCTAssertEqual(views.count, 2, "number of Measurements rows in list")
        }
        
        wait(for: [exp], timeout: 0.1)
    }

    func test_listFirstRowName_shouldBePressure() throws {
        let exp = sut.inspection.inspect { view in
            let list = try view.find(ViewType.List.self)
            let row = try list.find(MeasurementsRow.self)
            let hstack = try row.find(ViewType.VStack.self)
            XCTAssertEqual(try hstack.text(0).string(), "name: Pressure")
        }
        
        wait(for: [exp], timeout: 0.1)
    }
}
