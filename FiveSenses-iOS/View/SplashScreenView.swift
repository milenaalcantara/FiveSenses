 //
//  SplashScreenView.swift
//  FiveSenses-iOS
//
//  Created by Davi Capistrano on 22/06/23.
//

import SwiftUI
import Lottie

struct SplashScreenView: View {

    @Binding var ended: Bool // setar pra true no fim da execucao da splashscreen

    var body: some View {
        VStack {
            LottieView(name: "Splash01").ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        ended = true
                    }
                }
        }
    }
}
