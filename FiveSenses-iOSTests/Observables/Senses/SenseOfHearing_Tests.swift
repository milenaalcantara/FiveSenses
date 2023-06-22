//
//  SenseOfHearing_Tests.swift
//  FiveSenses-iOSTests
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import SwiftUI
import XCTest
@testable import FiveSenses_iOS


final class SenseOfHearing_Tests: XCTestCase {
    // MARK: - Test Of Hearing Sense
    
    func test_NumberOfSensesOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let numberOfSenses: Int = sense.numberOfSenses
        XCTAssertEqual(numberOfSenses, 4)
    }
    
    func test_SenseColorOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let color: Color = sense.color
        XCTAssertEqual(color, .cyan)
    }
    
    func test_SenseIconOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let iconName: String = sense.icon
        XCTAssertEqual(iconName, "ear")
    }
    
    func test_SenseProgressOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let progress: Double = sense.progress
        XCTAssertEqual(progress, 0.4)
    }
    
    func test_SenseIosDescriptionOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let iosDescription: String = sense.iosDescription
        let description = "Enter 4 sounds you are hearing"
        XCTAssertEqual(iosDescription, description)
    }
    
    func test_SenseWatchDescriptionOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let watchDescription: String = sense.watchDescription
        let description = "Think of 4 sounds"
        XCTAssertEqual(watchDescription, description)
    }
    
    func test_SensePlaceholderOfHearing() throws {
        let sense: Sense = Sense()
        sense.senseOption = .hearing
        let placeholder: String = sense.placeholder
        let description = "What are you listening?"
        XCTAssertEqual(placeholder, description)
    }

}
