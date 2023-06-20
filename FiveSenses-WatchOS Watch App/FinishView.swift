//
//  FinishView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 18/06/23.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        NavigationLink {
            ContentView()
        } label: {
            HStack {
                Text("Redo")
                Image(systemName: "arrow.counterclockwise")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
