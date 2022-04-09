//
//  ContentViewTest.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 8/4/2022.
//

import XCTest
import ViewInspector
@testable import Measurements

extension ContentView: Inspectable {}

extension MeasurementRow: Inspectable {}

class ContentViewTest: XCTestCase {
    
    private var sut: ContentView!
    
    override func setUp() {
        super.setUp()
        let presenter = Presenter(presentee: [
            Measurement(name: "Hi, Jack"),
            Measurement(name: "Hi, Joe"),
            Measurement(name: "Hi, Sam"),
            Measurement(name: "Hi, Oliver")
        ])
        sut = ContentView(presenter: presenter)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ContentView_hasList() {
        XCTAssertFalse(try sut.inspect().find(ViewType.List.self).isAbsent, "Measurements List does exist")
    }
    
    func test_List_hasMeasurementsRow() throws {
        let list = try sut.inspect().find(ViewType.List.self)
        
        XCTAssertFalse(try list.find(MeasurementRow.self).isAbsent)
    }
    
    func test_List_rowsNumber_shouldReturnFour() throws {
        let list = try sut.inspect().find(ViewType.List.self)
        let views = list.findAll(MeasurementRow.self)
        
        XCTAssertEqual(views.count, 4, "number of Measurements rows in list")
    }
    
    func test_listFirstRowText_shouldGreetJack() throws {
        let list = try sut.inspect().find(ViewType.List.self)
        let row = try list.find(MeasurementRow.self)
        
        XCTAssertEqual(try row.text().string(), "Hi, Jack")
    }
}
