//
//  TextFieldCollection.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct TextFieldCustom: View {
    @EnvironmentObject var sense: Sense
    
    @State var placeholder = ""
    @Binding var isEmptyField: Bool
    
    @StateObject var viewModel = TextFieldCustomViewModel()
    
    var body: some View {
        VStack {
            TextField(placeholder , text: $viewModel.value)
                .onChange(of: sense.isChangedSense) {
                    if $0 {
                        viewModel.value = ""
                    }
                }
                .onChange(
                    of: viewModel.value,
                    perform: {
                        isEmptyField = viewModel.valueChanged(newValue: $0)
                    }
                )
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
