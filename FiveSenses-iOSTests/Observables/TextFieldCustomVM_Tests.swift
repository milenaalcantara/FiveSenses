//
//  TextFieldCustomVM_Tests.swift
//  FiveSenses-iOSTests
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import XCTest
@testable import FiveSenses_iOS

final class TextFieldCustomVM_Tests: XCTestCase {
    func test_ValueIsEmpty() throws {
        let viewModel = TextFieldCustomViewModel()
        var isEmptyValue: Bool = viewModel.value.isEmpty
        XCTAssertEqual(isEmptyValue, true)
        
        viewModel.value = "   "
        isEmptyValue = viewModel.valueChanged(newValue: "")
        XCTAssertEqual(isEmptyValue, true)
        XCTAssertEqual(viewModel.value, "")
    }
    
    func test_ValueIsNotEmpty() throws {
        let viewModel = TextFieldCustomViewModel()
        viewModel.value = "mesa"
        let isEmptyValue: Bool = viewModel.value.isEmpty
        XCTAssertEqual(isEmptyValue, false)
    }
    
    func test_ValueIsChanged() throws {
        let viewModel = TextFieldCustomViewModel()
        viewModel.value = "mesa"
        var isChangedValue: Bool = viewModel.valueChanged(newValue: "")
        XCTAssertEqual(isChangedValue, true)
        
        viewModel.value = "   "
        isChangedValue = viewModel.valueChanged(newValue: "")
        XCTAssertEqual(isChangedValue, true)
        XCTAssertEqual(viewModel.value, "")
    }
    
    func test_ValueIsNotChanged() throws {
        let viewModel = TextFieldCustomViewModel()
        let isChangedValue: Bool = viewModel.valueChanged(newValue: "")
        XCTAssertEqual(isChangedValue, false)
    }

}
