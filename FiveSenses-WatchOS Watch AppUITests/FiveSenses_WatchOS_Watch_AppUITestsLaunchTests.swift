//
//  FiveSenses_WatchOS_Watch_AppUITestsLaunchTests.swift
//  FiveSenses-WatchOS Watch AppUITests
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import XCTest

final class FiveSenses_WatchOS_Watch_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
