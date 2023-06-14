//
//  TextFieldCustom.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 12/06/23.
//

import SwiftUI

struct TextFieldStyleCustom: TextFieldStyle {
    let canToTalk: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12.0)
                .stroke() // sem isso ficava com fundo preto "???"
                .frame(height: 54)
            
            configuration
                .padding(.leading)
                .foregroundColor(.gray)
        }
    }
}

//            if canToTalk {
//                Spacer()
//
//                HStack {
//                    configuration
//                    // Não possui mais o mic
//                    Image(systemName: "mic")
//
//                    Spacer(minLength: 10.0)
//                }
//                .padding(.leading)
//                .foregroundColor(.gray)
//            }
