//
//  InputFields.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

enum Sense: Int {
    case vision = 5
    case hearing = 4
    case feel = 3
    case smell = 2
    case palate = 1
}

struct InputFieldsCollection: View {
    
    let sense: Sense
    let placeholder: String
    
    var body: some View {
        VStack {
            ForEach(1...sense.rawValue, id: \.self) { _ in
                TextFieldCustom(placeholder: placeholder)
                
                Spacer(minLength: 16)
            }
        }
    }
}

struct InputFields_Previews: PreviewProvider {
    static let placeholder = "O que você está vendo?"
    static var previews: some View {
        InputFieldsCollection(sense: .vision, placeholder: placeholder)
    }
}
