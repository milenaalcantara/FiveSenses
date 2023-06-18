//
//  InputFields.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct TextFieldSenseModel: Identifiable {
    let id = UUID()
    var isEmpty = true
}

struct InputFieldsCollection: View {
    
    @EnvironmentObject var sense: Sense
        
    @State var textFieldModels: [TextFieldSenseModel] = []
    
    var body: some View {
        VStack {
            Text(sense.description)
                .padding(.bottom, 40)
            
            ForEach($textFieldModels) { $model in
                TextFieldCustom(isEmptyField: $model.isEmpty)
                    .padding(.vertical, 10)
            }
        }
        .onAppear {
            textFieldModels = (1...sense.senseOption.rawValue).map({ _ in .init() })
        }
        .onChange(of: sense.senseOption) { newValue in
            textFieldModels = (1...newValue.rawValue).map({ _ in .init() })
        }
        .onChange(of: textFieldModels.map(\.isEmpty)) { values in
            sense.areEmptyFields = values.contains(true)
        }
    }
}

struct InputFields_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldsCollection()
    }
}
