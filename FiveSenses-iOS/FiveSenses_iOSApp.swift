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

    let container = CKContainer(identifier: "iCloud.mapaPlacesLocation")

    var body: some Scene {
        WindowGroup {
//            FaceidView()
//            ContentView()
            MapaView(vm: PlaceListViewModel(container: container))
        }
    }
}
