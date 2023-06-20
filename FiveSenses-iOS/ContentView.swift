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
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
//    let container = CKContainer(identifier: "iCloud.mapaPlacesLocation")

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Main", systemImage: "star.fill")
                }
            MapaView() //vm: PlaceListViewModel(container: container)
                .tabItem {
                    Label("Mapa", systemImage: "star")
                }
        }
        .fullScreenCover(isPresented: .constant(!hasSeenOnboarding)) {
            Onboarding() {
                    hasSeenOnboarding = true
                }
                
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


