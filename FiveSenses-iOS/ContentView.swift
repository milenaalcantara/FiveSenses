//
//  ContentView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var value: String = ""
    
    var body: some View {
        VStack {
            TextField("O que você está vendo?" , text: $value.)
                .textFieldStyle(TextFieldCustom(canToTalk: true))
            
            Spacer(minLength: 16)
            
            TextField("O que você está vendo?" , text: $value.)
                .textFieldStyle(TextFieldCustom(canToTalk: true))
            
            Spacer(minLength: 16)
            
            TextField("O que você está vendo?" , text: $value.)
                .textFieldStyle(TextFieldCustom(canToTalk: true))
            
            Spacer(minLength: 16)
            TextField("O que você está vendo?" , text: $value.)
                .textFieldStyle(TextFieldCustom(canToTalk: true))
            
            Spacer(minLength: 16)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
