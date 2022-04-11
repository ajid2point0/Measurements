//
//  DoublyLinkedListTest.swift
//  MeasurementsTests
//
//  Created by Abderrahman Ajid on 11/4/2022.
//

import XCTest
@testable import Measurements

class DoublyLinkedListTest: XCTestCase {
    
    private var sut: DoublyLinkedList<String>!
    
    override func setUp() {
        super.setUp()
        sut =  DoublyLinkedList<String>()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_linkedList_isEmpty_shouldReturnTrue() {
        XCTAssertTrue(sut.isEmpty, "Linked list should be empty.")
    }
    
    func test_linkedListSize_shouldReturnZero() {
        XCTAssertEqual(sut.size, 0)
    }
    
    func test_linkedListSize_withSingleValue_shouldReturnOne() {
        sut.prepend("One")
        
        XCTAssertEqual(sut.size, 1)
    }
    
    func test_linkedListSize_withFiveValues_shouldReturnFive() {
        sut.prepend(contentOf:  ["One", "Two", "Three", "Four", "Five"])

        XCTAssertEqual(sut.size, 5)
    }
    
    func test_linkedListSize6_withRemoveAllUntilSizeIs3_shouldReturn3() {
        sut.prepend(contentOf: ["One", "Two", "Three", "Four", "Five", "Six"])
        XCTAssertEqual(sut.size, 6)
        
        sut.removeAll(until: 3)
        
        XCTAssertEqual(sut.size, 3)
    }
    
    func test_linkedListItems_withRemoveAllUntilSizeIs2_shouldReturnTwoLastElements() {
        sut.prepend(contentOf: ["One", "Two", "Three", "Four", "Five", "Six", "Seven"])
        
        sut.removeAll(until: 2)
        
        XCTAssertEqual(sut.items(), ["Seven", "Six"])
    }

}
