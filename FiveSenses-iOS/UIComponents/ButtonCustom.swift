//
//  ButtonCustom.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct ButtonCustom: View {
    let backgroundColor: Color
    let foregroundColor: Color
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button() {
            action()
        } label: {
            Text(title)
        }
        .frame(width: UIScreen.main.bounds.size.width * 0.9, height: 54)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(12)
    }
}

struct ButtonCustom_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustom(backgroundColor: .black, foregroundColor: .white, title: "Próximo") {
            print("próximo")
        }
    }
}
