//
//  SenseOfPalate_Tests.swift
//  FiveSenses-iOSTests
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import SwiftUI
import XCTest
@testable import FiveSenses_iOS

final class SenseOfPalate_Tests: XCTestCase {

    
    // MARK: - Test Of Palate Sense
    
    func test_NumberOfSensesOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let numberOfSenses: Int = sense.numberOfSenses
        XCTAssertEqual(numberOfSenses, 1)
    }
    
    func test_SenseColorOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let color: Color = sense.color
        XCTAssertEqual(color, .red)
    }
    
    func test_SenseIconOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let iconName: String = sense.icon
        XCTAssertEqual(iconName, "mouth")
    }
    
    func test_SenseProgressOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let progress: Double = sense.progress
        XCTAssertEqual(progress, 0.98)
    }
    
    func test_SenseIosDescriptionOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let iosDescription: String = sense.iosDescription
        let description = "Type 1 thing you can taste"
        XCTAssertEqual(iosDescription, description)
    }
    
    func test_SenseWatchDescriptionOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let watchDescription: String = sense.watchDescription
        let description = "Think of 1 flavor"
        XCTAssertEqual(watchDescription, description)
    }
    
    func test_SensePlaceholderOfPalate() throws {
        let sense: Sense = Sense()
        sense.senseOption = .palate
        let placeholder: String = sense.placeholder
        let description = "What would it taste like?"
        XCTAssertEqual(placeholder, description)
    }
}
