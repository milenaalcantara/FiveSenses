//
//  OnboardingOne.swift
//  Onboarding-project
//
//  Created by AJ Picard on 6/1/20.
//  Copyright © 2020 AJ Picard. All rights reserved.
//

import SwiftUI

struct OnboardingOne: View {
    var body: some View {
        VStack {
            VStack {
                Image("IllustrationOne")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("Bem-Vindo ao 5Sense")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding(.bottom, 20)
                Text("5 Sentidos, é uma prática de concentração plena, que tem como objetivo relaxar a mente em momentos de tensão. Vamos ao passo a passo.")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
            } 
        }
    }
}

struct OnboardingOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingOne()
    }
}
