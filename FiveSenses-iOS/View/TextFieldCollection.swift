//
//  TextFieldCollection.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct TextFieldCollection: View {

    @State var value: String = ""

    var body: some View {
        VStack {
            
        }
        .padding()
    }
}

struct TextFieldCollection_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCollection()
    }
}

/*
 //    @State var numberFields: Int
 ForEach(1...numberFields, id: \.self) { index in
     TextField("O que você está vendo?" , text: $value.)
         .textFieldStyle(TextFieldCustom(canToTalk: true))
     
     Spacer(minLength: 8)
 }
 */
