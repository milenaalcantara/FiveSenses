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
        VStack {
            ZStack {
                Circle()
                    .fill(sense.color.opacity(0.9))
                    .frame(
                        width: widthScreen * 0.2,
                        height: widthScreen * 0.2
                    )
                
                Image(systemName: sense.icon)
                    .foregroundColor(.white.opacity(0.95))
                    .font(.title)
            }
            
            ProgressView(value: sense.progress)
                .progressViewStyle(BarProgressStyle(sense: sense))
                .padding(.vertical, 20)
            
            InputFieldsCollection(sense: sense)
            
            Spacer()
            
            // modificar com type/mode... e enum
            ButtonCustom(
                backgroundColor: .black,
                foregroundColor: .white,
                title: "Próximo") {
                    switch sense {
                    case .vision:
                        sense = .hearing
                        return
                    case .hearing:
                        sense = .feel
                        return
                    case .feel:
                        sense = .smell
                        return
                    case .smell:
                        sense = .palate
                        return
                    case .palate:
                        print("finish")
                    }
            }
        }.navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


