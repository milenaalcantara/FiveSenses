//
//  Onboarding.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 19/06/23.
//

import SwiftUI

struct Onboarding: View {
    let handler: () -> Void

    // PageView
    @State var selectedTab: Int = 0

    // Circles
    @State var circleOpacity: Double = 0
    @State var sizeProportion: Double = 1
    @State var redCircleOffset: (x: Double, y: Double) = (0.6, -0.1)
    @State var blueCircleOffset: (x: Double, y: Double) = (-0.6, 0.3)
    
    let nameHost: String = "\(ProcessInfo().hostName)"

    var body: some View {
        ZStack(alignment: .top) {

            GeometryReader { proxy in
                Circle()
                    .fill(Color("Color_pink"))
                    .frame(
                        width: proxy.size.width * sizeProportion,
                        height: proxy.size.width * sizeProportion
                    )
                    .offset(
                        x: proxy.size.width * redCircleOffset.x,
                        y: proxy.size.height * redCircleOffset.y
                    )
                    .opacity(circleOpacity)

                Circle()
                    .fill(Color("Color_blue"))
                    .frame(
                        width: proxy.size.width * sizeProportion,
                        height: proxy.size.width * sizeProportion
                    )
                    .offset(
                        x: proxy.size.width * blueCircleOffset.x,
                        y: proxy.size.height * blueCircleOffset.y
                    )
                    .opacity(circleOpacity)
            }

            TabView(selection: $selectedTab) {
                OnboardingItemView(item: .init(
                    illustration: "IllustrationOne",
                    title: "Bem-vindo ao 5Senses",
                    content: "É uma prática de concentração total, que visa relaxar a mente em momentos de tensão. Vamos seguir passo a passo."
                ), index: 0, handler: {})
                .tag(0)

                OnboardingItemView(item: .init(
                    illustration: "IllustrationTwo",
                    title: "Sobre os Exercícios",
                    content: "A cada novo sentido, pense em elementos diferentes.",
                    height: 350,
                    width: 350
                ), index: 1, handler: {})
                .tag(1)

                OnboardingItemView(item: .init(
                    illustration: "IllustrationThree",
                    title: "Relaxe e aproveite!",
                    content: "Você pode praticar quantas vezes for necessário."
                ), index: 2, handler: handler)
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(.thinMaterial)
            .onChange(of: selectedTab) { newValue in
                withAnimation {
                    switch newValue {
                    case 0:
                        redCircleOffset = (0.6, -0.1)
                        blueCircleOffset = (-0.6, 0.3)
                    case 1:
                        redCircleOffset = (-0.3, -0.1)
                        blueCircleOffset = (-0.2, 0.8)
                    case 2:
                        redCircleOffset = (-0.9, 0.9)
                        blueCircleOffset = (0.1, 0.2)
                        saveName()
                    default:
                        break
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1)) {
                    circleOpacity = 1
                }
            }
        }
    }
    
    func saveName() {
        UserDefaults.standard.set(nameHost, forKey: "nameHost")
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding() {}
    }
}
