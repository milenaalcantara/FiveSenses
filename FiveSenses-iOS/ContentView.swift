//
//  ContentView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var value1: String = ""
    @State var value2: String = ""
    @State var value3: String = ""
    @State var value4: String = ""
    @State var value5: String = ""
    
    var body: some View {
        VStack {
            VStack {
                // MARK: Text Fields
                TextField("O que você está vendo?" , text: $value1)
                    .textFieldStyle(TextFieldStyleCustom(canToTalk: true))
                
                Spacer(minLength: 16)
                
                TextField("O que você está vendo?" , text: $value2)
                    .textFieldStyle(TextFieldStyleCustom(canToTalk: true))
                
                Spacer(minLength: 16)
                
                TextField("O que você está vendo?" , text: $value3)
                    .textFieldStyle(TextFieldStyleCustom(canToTalk: true))
                
                Spacer(minLength: 16)
                
                TextField("O que você está vendo?" , text: $value4)
                    .textFieldStyle(TextFieldStyleCustom(canToTalk: true))
                
                Spacer(minLength: 16)
                
                TextField("O que você está vendo?" , text: $value4)
                    .textFieldStyle(TextFieldStyleCustom(canToTalk: true))
                
                Spacer()
                
                // modificar com type... e enum
            }
            
            .padding()
            ButtonCustom(
                backgroundColor: .black,
                foregroundColor: .white,
                title: "Próximo") {
                  print("indo pro próximo")
            }
            
            Spacer(minLength: 40)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
