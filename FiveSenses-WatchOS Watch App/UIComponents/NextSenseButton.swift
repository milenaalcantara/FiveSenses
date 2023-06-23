//
//  ButtonCustomWatch.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 23/06/23.
//

import SwiftUI

struct NextSenseButton: View {
    @EnvironmentObject var sense: Sense
    @Binding var isEnabledButton: Bool
    @Binding var isFinished: Bool
    @Binding var timeElapsed: Int
    
    var body: some View {
        Button {
            switch sense.senseOption {
            case .vision:
                isEnabledButton.toggle()
                sense.senseOption = .hearing
                timeElapsed = 0
                return
            case .hearing:
                isEnabledButton.toggle()
                sense.senseOption = .feel
                timeElapsed = 0
                return
            case .feel:
                isEnabledButton.toggle()
                sense.senseOption = .smell
                timeElapsed = 0
                return
            case .smell:
                isEnabledButton.toggle()
                sense.senseOption = .palate
                timeElapsed = 0
                return
            case .palate:
                isFinished = true
                return
            }
        } label: {
            Text(isFinished ? "Finalizar" : "Próximo")
                .font(.body)
                .foregroundColor(.black )
                
        }
        .frame(height: 36)
        .background(.white )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .disabled(isEnabledButton)
        .padding(.horizontal, 20)
        .opacity(isEnabledButton ? 0.8 : 1)
    }
}

struct NextSenseButton_Previews: PreviewProvider {
    @State static private var isEnabledButton: Bool = true
    @State static private var isFinished: Bool = false
    @State static private var timeElapsed: Int = 0
    
    static var previews: some View {
        NextSenseButton(isEnabledButton: $isEnabledButton, isFinished: $isFinished, timeElapsed: $timeElapsed)
    }
}
