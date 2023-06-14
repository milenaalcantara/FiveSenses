//
//  TextFieldCustom.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 12/06/23.
//

import SwiftUI

struct TextFieldCustom: TextFieldStyle {
    let canToTalk: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12.0)
                .stroke() // sem isso ficava com fundo preto "???"
                .frame(height: 54)
    
            if canToTalk {
                Spacer()
                
                HStack {
                    configuration
                    
                    Image(systemName: "mic")
                    
                    Spacer(minLength: 10.0)
                }
                .padding(.leading)
                .foregroundColor(.gray)
            }
        }

    }
}
