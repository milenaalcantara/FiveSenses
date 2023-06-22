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
    
    var icon: String {
        switch self {
        case .vision:
            return "eye"
        case .hearing:
            return "ear"
        case .feel:
            return "hand.raised"
        case .smell:
            return "nose"
        case .palate:
            return "mouth"
        }
    }
    
    var color: Color {
        switch self {
        case .vision:
            return .purple
        case .hearing:
            return .cyan
        case .feel:
            return .green
        case .smell:
            return .orange
        case .palate:
            return .red
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
            return "Think of 5 images"
        case .hearing:
            return "Think of 4 sounds"
        case .feel:
            return "Think of 3 objects"
        case .smell:
            return "Think of 2 scents"
        case .palate:
            return "Think of 1 flavor"
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
