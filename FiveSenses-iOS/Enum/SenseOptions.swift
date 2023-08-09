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
            return "Digite 5 coisas que você está vendo"
        case .hearing:
            return "Digite 4 coisas que você está ouvindo"
        case .feel:
            return "Digite 3 coisas que você pode levar"
        case .smell:
            return "Digite 2 aromas que você pode sentir"
        case .palate:
            return "Digite 1 coisa que você pode provar"
        }
    }
    
    var watchDescription: String {
        switch self {
        case .vision:
            return "Digite 5 coisas que você está vendo"
        case .hearing:
            return "Digite 4 coisas que você está ouvindo"
        case .feel:
            return "Digite 3 coisas que você pode levar"
        case .smell:
            return "Digite 2 aromas que você pode sentir"
        case .palate:
            return "Digite 1 coisa que você pode provar"
        }
    }
    
    var placeholder: String {
        switch self {
        case .vision:
            return "O que você está vendo?"
        case .hearing:
            return "O que você está ouvindo?"
        case .feel:
            return "O que você pode jogar?"
        case .smell:
            return "Que perfume você sente agora?"
        case .palate:
            return "Qual seria o gosto?"
        }
    }
    
    var titleNextButton: String {
        switch self {
        case .palate:
            return "Finalizado"
        default:
            return "Próximo"
        }
    }
}
