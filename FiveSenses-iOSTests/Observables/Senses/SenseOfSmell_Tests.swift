//
//  SenseOfmell_Tests.swift
//  FiveSenses-iOSTests
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import SwiftUI
import XCTest
@testable import FiveSenses_iOS


final class SenseOfSmell_Tests: XCTestCase {

    // MARK: - Test Of Smell Sense
    
    func test_NumberOfSensesOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let numberOfSenses: Int = sense.numberOfSenses
        XCTAssertEqual(numberOfSenses, 2)
    }
    
    func test_SenseColorOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let color: Color = sense.color
        XCTAssertEqual(color, .orange)
    }
    
    func test_SenseIconOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let iconName: String = sense.icon
        XCTAssertEqual(iconName, "nose")
    }
    
    func test_SenseProgressOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let progress: Double = sense.progress
        XCTAssertEqual(progress, 0.8)
    }
    
    func test_SenseIosDescriptionOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let iosDescription: String = sense.iosDescription
        let description = "Enter 2 scents you can smell"
        XCTAssertEqual(iosDescription, description)
    }
    
    func test_SenseWatchDescriptionOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let watchDescription: String = sense.watchDescription
        let description = "Think of 2 scents"
        XCTAssertEqual(watchDescription, description)
    }
    
    func test_SensePlaceholderOfSmell() throws {
        let sense: Sense = Sense()
        sense.senseOption = .smell
        let placeholder: String = sense.placeholder
        let description = "What scent do you smell now?"
        XCTAssertEqual(placeholder, description)
    }
}
