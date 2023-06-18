//
//  FiveSenses_iOSApp.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI

@main
struct FiveSenses_iOSApp: App {
//    @State var sense: Sense = .vision
    @StateObject var sense: Sense = Sense()
    
    var body: some Scene {
        WindowGroup {
//            FaceidView()
            NavigationView {
                ContentView()
            }.environmentObject(sense)
        }
        
    }
}
