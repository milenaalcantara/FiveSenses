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
    @State private var pulse: CGFloat = 1
    @State private var isVisibleButton: Bool = false
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    let container = CKContainer(identifier: "iCloud.locaisVisitados")
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                Text("Let's find out what we can accomplish with our senses.")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink {
                    FiveSenses_WatchOS_Watch_App.SenseView(
//                        vm: PlaceListViewModel(
//                            container:
//                                 container
//                        )
                    )
                } label: {
                    Text("Start")
                }
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
