//
//  FiveSenses_iOSApp.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI
import CloudKit

@main
struct FiveSenses_iOSApp: App {
    // @State var sense: Sense = .vision
    @StateObject var sense: Sense = Sense()
    // let container = CKContainer(identifier: "iCloud.mapaPlacesLocation")

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Onboarding_View()
            }.environmentObject(sense)
        }
        
    }
}
