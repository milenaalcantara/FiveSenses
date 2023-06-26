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
                    title: "Bem-Vindo ao 5Sense",
                    content: "5 Sentidos, é uma prática de concentração plena, com objetivo de relaxar a mente em momentos de tensão."
                ), index: 0, handler: {})
                .tag(0)

                OnboardingItemView(item: .init(
                    illustration: "IllustrationTwo",
                    title: "Sobre Exercícios",
                    content: "A cada novo sentido, pense em coisas diferentes",
                    height: 350,
                    width: 350
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
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding() {}
    }
}
