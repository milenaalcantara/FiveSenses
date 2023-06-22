//
//  ButtonCustom.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct ButtonItem {
    let title: String?
    let font: Font?
    let backgroundColor: Color?
    let foregroundColor: Color?
    let height: CGFloat?
    let handle: (() -> Void)?
}

struct ButtonCustom: View {
    let item: ButtonItem
    
    var body: some View {
        Button() {
            (item.handle ?? {})()
        } label: {
            Text(item.title ??  "").font(item.font)
        }
        .frame(maxWidth: .infinity)
        .frame(height: item.height)
        .background(item.backgroundColor)
        .foregroundColor(item.foregroundColor)
        .cornerRadius(12)
    }
}

struct ButtonCustom_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustom(item: .init(
            title: "Next",
            font: .body,
            backgroundColor: .black,
            foregroundColor: .white,
            height: 54,
            handle: {}
        ))
    }
}
