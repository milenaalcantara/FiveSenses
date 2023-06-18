//
//  TextFieldCollection.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct TextFieldCustom: View {
    @EnvironmentObject var sense: Sense
    
    @Binding var isEmptyField: Bool
    
    @State var value: String = ""
    @State var placeholder = ""
    
    var body: some View {
        VStack {
            TextField(placeholder , text: $value)
                .onChange(of: sense.isChangedSense) {
                    if $0 {
                        value = ""
                    }
                }
                .onChange(of: value, perform: { newValue in
                    if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        value = ""
                        isEmptyField = true
                    } else {
                        isEmptyField = false
                    }
                })
                .textFieldStyle(TextFieldStyleCustom())
        }
        .onAppear {
            placeholder = sense.placeholder
        }
    }
}

struct TextFieldCollection_Previews: PreviewProvider {
    @State static var isEmptyField = false
    static var previews: some View {
        TextFieldCustom(isEmptyField: $isEmptyField)
    }
}

/*
 , onEditingChanged: { isChanged in
     if isChanged {
         if value == "" {
             sense.areEmptyFields = true
             isEmptyField = true
         } else {
             sense.areEmptyFields = false
             isEmptyField = false
         }
//                    if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//                        sense.areEmptyFields = true
//                        isEmptyField = true
//                    } else {
//                        sense.areEmptyFields = false
//                        isEmptyField = false
//                    }
     }
 */
