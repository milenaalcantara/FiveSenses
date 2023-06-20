//
//  Onboarding.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 19/06/23.
//

import SwiftUI

struct Onboarding: View {
    let handler: () -> Void
    
    var body: some View {
        TabView() {
            OnboardingItemView(item: .init(
                illustration: "IllustrationOne",
                title: "Bem-Vindo ao 5Sense",
                content: "5 Sentidos, é uma prática de concentração plena, com objetivo de relaxar a mente em momentos de tensão."
            ), index: 0, handler: {})
            .tag(0)
            
            OnboardingItemView(item: .init(
                illustration: "IllustrationTwo",
                title: "Sobre Exercícios",
                content: "A cada novo sentido, pense em coisas diferentes"
            ), index: 1, handler: {})
            .tag(1)
            
            OnboardingItemView(item: .init(
                illustration: "IllustrationThree",
                title: "Relaxe e Aproveite!",
                content: "Você pode praticar quantas vezes forem necessárias."
            ), index: 2, handler: handler)
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding() {}
    }
}
