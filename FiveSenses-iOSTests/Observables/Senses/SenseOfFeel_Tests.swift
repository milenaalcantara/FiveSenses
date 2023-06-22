//
//  SenseOfFeel_Tests.swift
//  FiveSenses-iOSTests
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import SwiftUI
import XCTest
@testable import FiveSenses_iOS

final class SenseOfFeel_Tests: XCTestCase {

    // MARK: - Test Of Feel Sense
    
    func test_NumberOfSensesOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let numberOfSenses: Int = sense.numberOfSenses
        XCTAssertEqual(numberOfSenses, 3)
    }
    
    func test_SenseColorOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let color: Color = sense.color
        XCTAssertEqual(color, .green)
    }
    
    func test_SenseIconOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let iconName: String = sense.icon
        XCTAssertEqual(iconName, "hand.raised")
    }
    
    func test_SenseProgressOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let progress: Double = sense.progress
        XCTAssertEqual(progress, 0.6)
    }
    
    func test_SenseIosDescriptionOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let iosDescription: String = sense.iosDescription
        let description = "Enter 3 things you can take"
        XCTAssertEqual(iosDescription, description)
    }
    
    func test_SenseWatchDescriptionOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let watchDescription: String = sense.watchDescription
        let description = "Think of 3 objects"
        XCTAssertEqual(watchDescription, description)
    }
    
    func test_SensePlaceholderOfFeel() throws {
        let sense: Sense = Sense()
        sense.senseOption = .feel
        let placeholder: String = sense.placeholder
        let description = "What can you play?"
        XCTAssertEqual(placeholder, description)
    }

}
