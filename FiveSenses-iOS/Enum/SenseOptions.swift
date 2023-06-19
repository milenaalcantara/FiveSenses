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
            return "Digite 5 coisas que você está vendo"
        case .hearing:
            return "Digite 4 sons que você está ouvindo"
        case .feel:
            return "Digite 3 coisas que você pode pegar"
        case .smell:
            return "Digite 2 aromas que você pode sentir"
        case .palate:
            return "Digite 1 coisa que você pode provar"
        }
    }
    
    var watchDescription: String {
        switch self {
        case .vision:
            return "Pense em 5 imagens"
        case .hearing:
            return "Pense em 4 sons"
        case .feel:
            return "Toque em 3 objetos"
        case .smell:
            return "Pense em 2 aromas"
        case .palate:
            return "Pense em 1 sabor"
        }
    }
    
    var placeholder: String {
        switch self {
        case .vision:
            return "O que você está vendo?"
        case .hearing:
            return "O que você está ouvindo?"
        case .feel:
            return "O que você consegue tocar?"
        case .smell:
            return "Que aroma sente agora?"
        case .palate:
            return "Que sabor sentiria?"
        }
    }
}
