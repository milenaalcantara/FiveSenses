//
//  SenseOptions.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import Foundation
import SwiftUI


enum SenseOptions: Int, CaseIterable {
    case vision = 5
    case hearing = 4
    case feel = 3
    case smell = 2
    case palate = 1
    
    var imageName: String {
        switch self {
        case .vision:
            return "vision"
        case .hearing:
            return "hearing"
        case .feel:
            return "feel"
        case .smell:
            return "smell"
        case .palate:
            return "palate"
        }
    }
    
    var progress: Double {
        switch self {
        case .vision:
            return 0.2
        case .hearing:
            return 0.4
        case .feel:
            return 0.6
        case .smell:
            return 0.8
        case .palate:
            return 0.98
        }
    }
    
    var iosDescription: String {
        let key: String
        switch self {
        case .vision:
            key = "fiveSensesIOS"
        case .hearing:
            key =  "fourSensesIOS"
        case .feel:
            key = "threeSensesIOS"
        case .smell:
            key = "twoSensesIOS"
        case .palate:
            key = "oneSenseIOS"
        }
        
        return NSLocalizedString(key, comment: "")
    }
    
    var watchDescription: String {
        let key: String
        switch self {
        case .vision:
            key = "fiveSensesWatch"        case .hearing:
            key = "fourSensesWatch"
        case .feel:
            key = "threeSensesWatch"
        case .smell:
            key = "twoSensesWatch"
        case .palate:
            key = "oneSensesWatch"
        }
        
        return NSLocalizedString(key, comment: "")
    }
    
    var placeholder: String {
        let key: String
        switch self {
        case .vision:
            key = "placeholderVision"
        case .hearing:
            key = "placeholderHearing"
        case .feel:
            key = "placeholderFeel"
        case .smell:
            key = "placeholderSmell"
        case .palate:
            key = "placeholderPalate"
        }
        
        return NSLocalizedString(key, comment: "")
    }
    
    var titleNextButton: String {
        let key: String
        switch self {
        case .palate:
            key = "finishedButton"
        default:
            key = "nextButton"
        }
        
        return NSLocalizedString(key, comment: "")
    }
}
