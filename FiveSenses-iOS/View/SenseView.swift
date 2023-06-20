//
//  SenseView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 18/06/23.
//

import SwiftUI

struct SenseView: View {
    @EnvironmentObject var sense: Sense
    @State private var isFinished: Bool = false

    @State var title = "Próximo"
    
    var body: some View {
        VStack(alignment: .center) {
            HeaderSenseView()
            
            InputFieldsCollection()
                .id(sense.senseOption.rawValue)
                .padding(.horizontal)
            
            Spacer()
            
            ButtonCustom(
                backgroundColor: .black,
                foregroundColor: .white,
                font: .body,
                title: title,
                height: 54
            ) {
                switch sense.senseOption {
                case .vision:
                    if !sense.areEmptyFields {
                        sense.senseOption = .hearing
                        sense.isChangedSense = true
                        return
                    }
                case .hearing:
                    if !sense.areEmptyFields {
                        sense.senseOption = .feel
                        sense.isChangedSense = true
                        return
                    }
                case .feel:
                    if !sense.areEmptyFields {
                        sense.senseOption = .smell
                        sense.isChangedSense = true
                        return
                    }
                case .smell:
                    if !sense.areEmptyFields {
                        sense.senseOption = .palate
                        sense.isChangedSense = true
                        title = "Finished"
                        return
                    }
                case .palate:
                    if !sense.areEmptyFields {
                        isFinished = true
//                        NavigationLink( destination: SenseView(), isActive: $isFinished)
                        return
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SenseView_Previews: PreviewProvider {
    static var previews: some View {
        SenseView()
    }
}
