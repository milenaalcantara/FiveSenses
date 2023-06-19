//
//  ContentView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sense: Sense
    @State private var pulse: CGFloat = 1
    @State private var isVisibleButton: Bool = false
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Text("Vamos descobrir o que podemos realizar com nossos sentidos.")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink {
                    SenseView()
                } label: {
                    Text("Iniciar")
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
