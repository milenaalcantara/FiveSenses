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
    @AppStorage("imageIcon") var imageIcon = "face01"

    //funcao pra ver se é o dia atual, e resetar a face para a inicial
    let container = CKContainer(identifier: "iCloud.locaisVisitados")

    var body: some View {
        NavigationView {
            VStack {
                Image(imageIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(.top, 90)

                Spacer()
                VStack {
                    Text("5 Sense: Vamos descobrir o que podemos realizar com nossos sentidos.")
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .trailing], 40)
                    
                    NavigationLink {
                        SenseView(imageIcon: $imageIcon, vm: PlaceListViewModel(container: container))
                    } label: {
                        Text("Iniciar Exercício")
                            .foregroundColor(.white)
                    }
                    .task {
                        sense.senseOption = .vision
                        print("chamando senseView")
                    }
                    .frame(maxWidth: 280)
                    .frame(height: 54)
                    .background(.black).cornerRadius(12)
                    .padding([.bottom, .leading, .trailing], 40)
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Color_cinza"))
                        .padding(10)
                }.padding(.bottom, 60)


            }.navigationTitle("Bem-vindo, usuário")
        }.navigationBarBackButtonHidden()
    }
}
