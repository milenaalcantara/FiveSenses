//
//  SenseView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 18/06/23.
//

import SwiftUI

struct SenseView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sense: Sense
    @State private var isFinished: Bool = false
    @Binding var imageIcon: String

    @State var title = "Próximo"
    
    var body: some View {
        NavigationView {
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
                            guard let nextIconName = getNextIconName() else { return }
                            isFinished = true
                            imageIcon = nextIconName
                            dismiss()
                            return
                        }
                    }
                }
                .padding(.horizontal)
                
            
            }
        }
    }

    private func getNextIconName() -> String? {
        guard let lastImageIconStringCharacter = imageIcon.map({String($0)}).last else { return nil }
        guard let lastImageIndex = Int(lastImageIconStringCharacter) else { return nil }
        let nextImageIconIndex = lastImageIndex < 4 ? lastImageIndex + 1 : 4

        return "face0\(nextImageIconIndex)"
    }
}

//struct SenseView_Previews: PreviewProvider {
//    static var previews: some View {
//        SenseView()
//    }
//}
