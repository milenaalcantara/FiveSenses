//
//  InputFields.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI


struct InputFieldsCollection: View {
    
    let sense: Sense
    
    var body: some View {
        VStack {
            Text(sense.description)
                .padding(.bottom, 40)
            
            ForEach(1...sense.rawValue, id: \.self) { _ in
                TextFieldCustom(placeholder: sense.placeholder)
                    .padding(.vertical, 10)
                
            }
        }
    }
}

struct InputFields_Previews: PreviewProvider {
    static let placeholder = "O que você está vendo?"
    static var previews: some View {
        InputFieldsCollection(sense: .vision)
    }
}
