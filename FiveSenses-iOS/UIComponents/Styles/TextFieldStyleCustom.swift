//
//  TextFieldCustom.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 12/06/23.
//

import SwiftUI

struct TextFieldStyleCustom: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke() // sem isso ficava com fundo preto "???"
                    
                
                configuration
                    .padding(.leading)
                    .foregroundColor(.gray)
            }
            .frame(width: geometry.size.width, height: 54)
        }
    }
}
