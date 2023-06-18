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
    
    var numberOfSenses: Int {
        return senseOption.rawValue
    }
    
    var color: Color {
        return senseOption.color
    }
    
    var icon: String {
        return senseOption.icon
    }
    
    var progress: Double {
        return senseOption.progress
    }
    
    var description: String {
        return senseOption.description
    }
    
    var placeholder: String {
        return senseOption.placeholder
    }
}
