//
//  TextFieldCustomViewModel.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 21/06/23.
//

import Foundation

class TextFieldCustomViewModel: ObservableObject {
    @Published var value: String = ""
    
    func valueChanged(newValue: String) -> Bool {
        if value != "" {
            if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                value = ""
            }
            return true
        } else {
            return false
        }
    }
}
