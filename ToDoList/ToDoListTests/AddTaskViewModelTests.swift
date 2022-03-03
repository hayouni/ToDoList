//
//  AddTaskViewModelTests.swift
//  ToDoListTests
//
//  Created by Saiefeddine HAYOUNI on 03/03/2022.
//

import SwiftUI
import XCTest
@testable import ToDoList

class AddTaskViewModelTests: XCTestCase {
    let vm = AddTaskViewModelMock()

    func testAddTaskViewModel_alertTile_shouldBe_Empty() throws {
        XCTAssertEqual(vm.alertTile, "")
    }
    
    func testAddTaskViewModel_isAppropriate_shouldBe_true() throws {
        XCTAssertFalse(vm.isAppropriate(text: "a"))
    }
    
    func testAddTaskViewModel_showAlert_shouldBe_true() throws {
       let _ = vm.isAppropriate(text: "a")
        XCTAssertTrue(vm.showAlert)

    }
    func testAddTaskViewModel_alertTile_shouldBe_alertTitleString() throws {
        let _ = vm.isAppropriate(text: "a")
       XCTAssertEqual(vm.alertTile, alertTitleString)
    }
    
    func testAddTaskViewModel_alert_shouldBe_nortil() throws {
        let _ = vm.isAppropriate(text: "a")
        XCTAssertNotNil(vm.getAlert() )
    }

}
