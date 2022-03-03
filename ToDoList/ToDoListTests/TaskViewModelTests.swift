//
//  TaskViewModelTests.swift
//  ToDoListTests
//
//  Created by Saiefeddine HAYOUNI on 03/03/2022.
//

import XCTest
@testable import ToDoList
import SwiftUI

class TaskViewModelTests: XCTestCase {
    let vm = TaskViewModelMock(isCompleted: false)

 
    func testTaskViewModelTests_alertTile_should_Equal_TaskViewModelMock() throws {
        XCTAssertEqual(vm.name, "TaskViewModelMock")
    }
    
    func testTaskViewModelTests_isAppropriate_shouldBe_false() throws {
        XCTAssertFalse(vm.isCompleted)
    }
    
    func testTaskViewModelTests_createdAt_shouldequal_Date() throws {
        XCTAssertEqual(vm.createdAt.year, Date().year)
        XCTAssertEqual(vm.createdAt.day, Date().day)
        XCTAssertEqual(vm.createdAt.month, Date().month)
    }
    
    func testTaskViewModelTests_showAlert_shouldBe_true() throws {
        vm.isCompleted = true
        XCTAssertTrue(vm.isCompleted)
    }
    
}
