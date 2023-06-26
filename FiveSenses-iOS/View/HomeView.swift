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
    @AppStorage("animationName") var animationName = "face_01"

    //funcao pra ver se é o dia atual, e resetar a face para a inicial
    let container = CKContainer(identifier: "iCloud.locaisVisitados")

    var body: some View {
        NavigationStack {
            VStack {
                LottieView(name: animationName)
                    .frame(width: 250, height: 250)
                    .padding(.top, 90)
                    .id(animationName)

                Spacer()
                VStack {
                    Text("5 Sense: Vamos descobrir o que podemos realizar com nossos sentidos.")
                        .fontWeight(Font.Weight.medium)
                        .font(Font.body)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .trailing], 40)
                        .foregroundColor(Color(uiColor: .black))
                    
                    NavigationLink {
                        SenseView(vm: PlaceListViewModel(container: container), animationName: $animationName)
                    } label: {
                        Text("Iniciar Exercício")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .frame(maxWidth: 320)
                            .frame(height: 54)
                            .background(.black).cornerRadius(12)
                    }
                    .task {
                        sense.senseOption = .vision
                    }

                    .padding(.bottom, 40)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                }
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("Color_cinza"))
                        .padding(10)
                }
                .padding(.bottom, 60)


            }.navigationTitle("Bem-vindo, usuário")
        }.navigationBarBackButtonHidden()
    }
}
