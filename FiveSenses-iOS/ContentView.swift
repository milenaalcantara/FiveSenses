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
                    Label("Exercise", systemImage: "text.book.closed.fill")
//                    TabIcon(icon: UIImage(named: "book")!, size: CGSize(width: 40, height: 40))
//
//                    Text("Exercise").foregroundColor(.black)
                }
            MapaView(vm: PlaceListViewModel(container: container))
                .tabItem {
                    Label("Historic", systemImage: "map")
//                    TabIcon(icon: UIImage(named: "map")!, size: CGSize(width: 40, height: 40))
//
//                    Text("Historic").foregroundColor(.black)
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

struct TabIcon: View {
    var icon: UIImage
    var size: CGSize = CGSize(width: 30, height: 30)

    // Based on https://stackoverflow.com/a/32303467
    var roundedIcon: UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        defer {
            // End context after returning to avoid memory leak
            UIGraphicsEndImageContext()
        }

        UIBezierPath(
            roundedRect: rect,
            cornerRadius: self.size.height
            ).addClip()
        icon.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }

    var body: some View {
        Image(uiImage: roundedIcon.withRenderingMode(.alwaysOriginal))
    }
}


