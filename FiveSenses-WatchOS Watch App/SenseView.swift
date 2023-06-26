//
//  SenseView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI
import MapKit
import CloudKit


struct SenseView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var sense: Sense

    @StateObject var vm: PlaceListViewModel

    @State private var isEnabledButton: Bool = true
    @State private var isFinished: Bool = false
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            VStack {
                textSense
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 20)
                
                ImageCustomView()
                    .frame(width: 36)
                
                Spacer(minLength: 20)
                
                NextSenseButton(isEnabledButton: $isEnabledButton, isFinished: $isFinished, timeElapsed: $timeElapsed)
                    .onReceive(timer) { _ in
                        if timeElapsed == (sense.numberOfSenses * 2) {
                            if timeElapsed > 1 {
                                withAnimation {
                                    isEnabledButton.toggle()
                                }
                            }
                        }
                        timeElapsed = 1 + timeElapsed
                    }
            }
        }
        .alert(Text("Salvar"), isPresented: $isFinished, actions: {
                    Button {
                        vm.saveLocation()
                        dismiss()
                    } label: {
                        Text("Salvar")
                    }

                    Button("Cancel", role: .cancel) {

                    }

                }, message: {
                    Text("Deseja salvar a frequência que você realizou o exercício?")
        })
    }
    
    var textSense: some View {
        Text(sense.watchDescription)
            .font(.footnote)
            .padding()
    }


}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
