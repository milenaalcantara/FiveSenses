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
    let font: Font
    let title: String
    let height: CGFloat
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            Button() {
                action()
            } label: {
                Text(title).font(font)
            }
            .frame(
                width: geometry.size.width,
                height: height
            )
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(12)
        }
    }
}

struct ButtonCustom_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustom(backgroundColor: .black, foregroundColor: .white, font: .body, title: "Próximo", height: 54) {
            print("próximo")
        }
    }
}
