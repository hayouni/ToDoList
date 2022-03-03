//
//  TaskDetailsViewModelTests.swift
//  ToDoListTests
//
//  Created by Saiefeddine HAYOUNI on 03/03/2022.
//

import XCTest
@testable import ToDoList

class TaskDetailsViewModelTests: XCTestCase {

    let vm = TaskDetailsViewModelMock()

 
    func testTaskDetailsViewModelTests_namee_should_Equal_Test_Mock() throws {
        XCTAssertEqual(vm.name, "Test Mock")
    }
    
    func testTaskDetailsViewModelTests_header_shouldBe_EqualTo_TestHeader() throws {
        XCTAssertEqual(vm.header, "Test Header")
    }
    
    func testTaskDetailsViewModelTests_createdAt_shouldequal_Date() throws {
        XCTAssertEqual(vm.createdAt.year, Date().year)
        XCTAssertEqual(vm.createdAt.day, Date().day)
        XCTAssertEqual(vm.createdAt.month, Date().month)    }
    
    func testTaskDetailsViewModelTests_headerColor_shouldBe_red() throws {
        XCTAssertEqual(vm.headerColor, .red)
    }

}
