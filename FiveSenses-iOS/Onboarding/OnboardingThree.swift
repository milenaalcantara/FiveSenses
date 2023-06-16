//
//  OnboardingThree.swift
//  Onboarding-project
//
//  Created by AJ Picard on 6/1/20.
//  Copyright © 2020 AJ Picard. All rights reserved.
//

import SwiftUI

struct OnboardingThree: View {
    var body: some View {
        VStack {
            VStack {
                Image("IllustrationThree")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("Relaxe e Aproveite!")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding(.bottom, 20)
                Text("Você pode praticar os exercícios quantas vezes forem necessárias.")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
            }
        }
    }
}

struct OnboardingThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingThree()
    }
}
