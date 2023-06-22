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
                    .frame(width: 200, height: 200)
                    .padding(.top, 90)

                Spacer()
                VStack {
                    Text("Vamos descobrir o que podemos realizar com nossos sentidos.")
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing], 40)

                    NavigationLink {
//                        SenseView(imageIcon: $imageIcon, vm: PlaceListViewModel(container: container))
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
                    .frame(height: 30)
                    .background(.black).cornerRadius(12)
                    .padding([.bottom, .leading, .trailing], 40)
//                    .padding(.bottom, 100)
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .padding(10)
                }



            }.navigationTitle("Bem-vindo, usuário")
        }.navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
