//
//  ContentView.swift
//  FiveSenses-iOS
//
//  Created by Davi Capistrano on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sense: Sense
    
    var body: some View {
        VStack {
            HeaderSenseView()
            
            InputFieldsCollection()
                .id(sense.senseOption.rawValue)
            
            Spacer()
            
            ButtonCustom(
                backgroundColor: .black,
                foregroundColor: .white,
                title: "Próximo") {
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
                            return
                        }
                    case .palate:
                        if !sense.areEmptyFields {
                            print("finish")
                            return
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
