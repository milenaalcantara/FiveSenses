//
//  ContentView.swift
//  FiveSenses-iOS
//
//  Created by Davi Capistrano on 14/06/23.
//

import SwiftUI
import CloudKit

struct ContentView: View {

    @EnvironmentObject var sense: Sense
    let container = CKContainer(identifier: "iCloud.mapaPlacesLocation")

    var body: some View {
        TabView {
            homeView
                .tabItem {
                    Label("Main", systemImage: "star.fill")
                }
            MapaView(vm: PlaceListViewModel(container: container))
                .tabItem {
                    Label("Mapa", systemImage: "star")
                }
        }

    }

    var homeView: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()

                Text("Vamos descobrir o que podemos realizar com nossos sentidos.")
                    .padding(.vertical)
                    .multilineTextAlignment(.center)

                NavigationLink {
                    SenseView(vm: PlaceListViewModel(container: container))
                } label: {
                    Text("Iniciar Exercício")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .frame(width: geometry.size.width, height: 50)
                .background(.black)
                .cornerRadius(12)
                .padding(.vertical)
                .task {
                    sense.senseOption = .vision
                }
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


