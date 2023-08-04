//
//  ContentView.swift
//  PocFaceID
//
//  Created by Davi Capistrano on 06/06/23.
//

import SwiftUI
import LocalAuthentication

struct FaceidView: View {
    @State private var unlocked = false
    @State private var text = "5SENSES BLOQUEADO"
    @State private var subtext = "Use o FaceID para desbloquear o aplicativo."
    @State private var isShowingDetailView = false //Booleano
    @EnvironmentObject var sense: Sense
    
    var body: some View {

        NavigationStack {
            VStack {
                Image(systemName: "lock.shield")
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text(text)
                    .font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
                Text(subtext)
                Spacer()
                Button("Use FaceID"){
                    authenticate()
                }.buttonStyle(.borderedProminent)
                NavigationLink(destination: ContentView(hasFinishSplash: false).navigationBarBackButtonHidden(), isActive: $isShowingDetailView) { }
                // mudar para uma versão não depreciada 
                // Carregar o valor boleano, e ao ficar true chama a TesteView()
            }
            .padding()
        }
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is for security reasons") {success, authenticationError in

                if success {
                    isShowingDetailView = true
                    //Quando o Face ID For sucesso ele seta para true.

                } else {
                    text = "HÁ um problema!"
                }
            }
        } else {
            text = "Telefone não possui biometria"
        }
    }
}

struct FaceidView_Previews: PreviewProvider {
    static var previews: some View {
        FaceidView()
    }
}
