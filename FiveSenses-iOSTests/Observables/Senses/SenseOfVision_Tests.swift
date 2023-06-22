//
//  SenseOfVision_Tests.swift
//  FiveSenses-iOSTests
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import SwiftUI
import XCTest
@testable import FiveSenses_iOS

final class SenseOfVision_Tests: XCTestCase {
    // MARK: - Test Of Vision Sense
    
    func test_NumberOfSensesOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let numberOfSenses: Int = sense.numberOfSenses
        XCTAssertEqual(numberOfSenses, 5)
    }
    
    func test_SenseColorOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let color: Color = sense.color
        XCTAssertEqual(color, .purple)
    }
    
    func test_SenseIconOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let iconName: String = sense.icon
        XCTAssertEqual(iconName, "eye")
    }
    
    func test_SenseProgressOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let progress: Double = sense.progress
        XCTAssertEqual(progress, 0.2)
    }
    
    func test_SenseIosDescriptionOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let iosDescription: String = sense.iosDescription
        let description = "Enter 5 things you are seeing"
        XCTAssertEqual(iosDescription, description)
    }
    
    func test_SenseWatchDescriptionOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let watchDescription: String = sense.watchDescription
        let description = "Think of 5 images"
        XCTAssertEqual(watchDescription, description)
    }
    
    func test_SensePlaceholderOfVision() throws {
        let sense: Sense = Sense()
        sense.senseOption = .vision
        let placeholder: String = sense.placeholder
        let description = "What are you seeing?"
        XCTAssertEqual(placeholder, description)
    }

}
