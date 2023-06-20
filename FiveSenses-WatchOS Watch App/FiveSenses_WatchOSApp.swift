//
//  FiveSenses_WatchOSApp.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI

@main
struct FiveSenses_WatchOS_Watch_AppApp: App {
    @StateObject var sense: Sense = Sense()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.environmentObject(sense)
        }
    }
}
