//
//  ContentView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI
import CloudKit

struct ContentView: View {
    @EnvironmentObject var sense: Sense
    
    let container = CKContainer(identifier: "iCloud.locaisVisitados")
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                Text("Vamos descobrir o que podemos realizar com nossos sentidos.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                NavigationLink {
//                    FiveSenses_WatchOS_Watch_App.
                    SenseView(
                        vm: PlaceListViewModel(
                            container:
                                 container
                        )
                    )
                } label: {
                    Text("Começar")
                        .foregroundColor(.black )
                }
                .frame(height: 36)
                .background(.white )
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 20)
                .task {
                    sense.senseOption = .vision
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
