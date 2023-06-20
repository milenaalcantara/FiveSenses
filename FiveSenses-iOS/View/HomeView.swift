//
//  HomeView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 19/06/23.
//

import SwiftUI
import CloudKit

struct HomeView: View {
    @EnvironmentObject var sense: Sense
    let container = CKContainer(identifier: "iCloud.locaisVisitados")
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Vamos descobrir o que podemos realizar com nossos sentidos.")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink {
                    SenseView(vm: PlaceListViewModel(container: container))
                } label: {
                    Text("Iniciar")
                        .foregroundColor(.white)
                }
                .task {
                    sense.senseOption = .vision
                    print("chamando senseView")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(.black).cornerRadius(12)
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
