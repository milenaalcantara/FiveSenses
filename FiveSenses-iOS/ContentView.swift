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
    let container = CKContainer(identifier: "iCloud.locaisVisitados")

    let hasFinishSplash: Bool

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Exercício", systemImage: "book")
                }
            MapaView(vm: PlaceListViewModel(container: container))
                .tabItem {
                    Label("Mapa", systemImage: "map")
                }
        }
        .opacity(hasSeenOnboarding ? 1 : 0)
        .navigationBarBackButtonHidden(!hasSeenOnboarding)
        .fullScreenCover(isPresented: .constant(!hasSeenOnboarding && hasFinishSplash)) {
            Onboarding() {
                hasSeenOnboarding = true
                UINavigationBar.setAnimationsEnabled(true)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(hasFinishSplash: true)
    }
}


