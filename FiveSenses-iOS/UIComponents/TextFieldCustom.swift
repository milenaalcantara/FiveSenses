//
//  TextFieldCollection.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct TextFieldCustom: View {
    let placeholder: String
    
    @State var value: String = ""

    var body: some View {
        VStack {
            TextField(placeholder, text: $value)
                .textFieldStyle(TextFieldStyleCustom())
        }
    }
}

struct TextFieldCollection_Previews: PreviewProvider {
    static let text = "O que você está vendo?"
    static var previews: some View {
        TextFieldCustom(placeholder: text)
    }
}
