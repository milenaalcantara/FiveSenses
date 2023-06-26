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
        switch self {
        case .vision:
            return "Enter 5 things you are seeing"
        case .hearing:
            return "Enter 4 sounds you are hearing"
        case .feel:
            return "Enter 3 things you can take"
        case .smell:
            return "Enter 2 scents you can smell"
        case .palate:
            return "Type 1 thing you can taste"
        }
    }
    
    var watchDescription: String {
        switch self {
        case .vision:
            return "Think of 5 things you are selling"
        case .hearing:
            return "Think of 4 things you are hearing"
        case .feel:
            return "Think of 3 things you can touch"
        case .smell:
            return "Think of 2 smells you can smell"
        case .palate:
            return "Think of 1 thing you can prove"
        }
    }
    
    var placeholder: String {
        switch self {
        case .vision:
            return "What are you seeing?"
        case .hearing:
            return "What are you listening?"
        case .feel:
            return "What can you play?"
        case .smell:
            return "What scent do you smell now?"
        case .palate:
            return "What would it taste like?"
        }
    }
}
