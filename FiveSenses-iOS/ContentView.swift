//
//  ContentView.swift
//  FiveSenses-iOS
//
//  Created by Davi Capistrano on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sense: Sense
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                
                Text("Vamos descobrir o que podemos realizar com nossos sentidos.")
                    .padding(.vertical)
                    .multilineTextAlignment(.center)
                
//                HStack(alignment: .center) {
                NavigationLink {
                    SenseView()
                } label: {
                    Text("Iniciar Exercício")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .frame(width: geometry.size.width, height: 50)
                .background(.black)
                .cornerRadius(12)
                .padding(.vertical)
//                }
                
                Spacer()
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
