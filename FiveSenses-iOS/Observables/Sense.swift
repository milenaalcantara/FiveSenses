//
//  Sense.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 15/06/23.
//

import Foundation
import SwiftUI

class Sense: ObservableObject {
    @Published var senseOption: SenseOptions = .vision
    
    @Published var isChangedSense: Bool = false
    @Published var areEmptyFields: Bool = true
    @Published var isFinished: Bool = false

    
    var numberOfSenses: Int {
        return senseOption.rawValue
    }
    
    var imageName: String {
        senseOption.imageName
    }
    
    var progress: Double {
        return senseOption.progress
    }
    
    var iosDescription: String {
        return senseOption.iosDescription
    }
    
    var watchDescription: String {
        return senseOption.watchDescription
    }
    
    var placeholder: String {
        return senseOption.placeholder
    }
    
    var titleNextButton: String {
        return senseOption.titleNextButton
    }
    
    func toggleSense() {
        switch senseOption {
        case .vision:
            if !areEmptyFields {
                senseOption = .hearing
                isChangedSense = true
                return
            }
        case .hearing:
            if !areEmptyFields {
                senseOption = .feel
                isChangedSense = true
                return
            }
        case .feel:
            if !areEmptyFields {
                senseOption = .smell
                isChangedSense = true
                return
            }
        case .smell:
            if !areEmptyFields {
                senseOption = .palate
                isChangedSense = true
                return
            }
        case .palate:
            if !areEmptyFields {
                isFinished = true
                return
            }
        }
    }
}
