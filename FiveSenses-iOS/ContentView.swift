//
//  ContentView.swift
//  FiveSenses-iOS
//
//  Created by Davi Capistrano on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            InputFieldsCollection(
                sense: .feel,
                placeholder: "O que você está vendo?"
            )
            
            Spacer()
            
            // modificar com type/mode... e enum
            ButtonCustom(
                backgroundColor: .black,
                foregroundColor: .white,
                title: "Próximo") {
                  print("indo pro próximo")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
