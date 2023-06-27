//
//  OnboardingItemView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 19/06/23.
//

import SwiftUI

//typealias OnboardingGetStartedAction = () -> Void

struct OnboardingItemView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    let item: OnboardingItem
    
    let limit: Int = 2
    var index: Int
    
    let handler: () -> Void
    
    init(item: OnboardingItem, index: Int, handler: @escaping () -> Void) {
        self.item = item
        self.index = index
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(item.illustration ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: item.width, height: item.height)
            
            Text(item.title ?? "")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.bottom, 20)
            
            Text(item.content ?? "")
                .font(.system(
                    size: 17, weight: .medium, design: .rounded
                ))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            
            ButtonCustom(
                backgroundColor: .black,
                foregroundColor: .white,
                font: .system(size: 17, weight: .medium, design: .rounded),
                title: "Começar",
                height: 54,
                action: {
                    presentationMode.wrappedValue.dismiss()
                    handler()
                }
            )
            .padding(.horizontal)
            .padding(.vertical, 10)
            .padding(.top, 50)
            .opacity(index == limit ? 1 : 0)
            .allowsHitTesting(index == limit)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.25)) {}
            }
        }
    }
}

struct OnboardingItemView_Previews: PreviewProvider {
    static var item: OnboardingItem = .init(
        illustration: "IllustrationOne",
        title: "Bem-Vindo ao 5Sense",
        content: "5 Sentidos, é uma prática de concentração plena, que tem como objetivo relaxar a mente em momentos de tensão. Vamos ao passo a passo."
    )

    static var previews: some View {
        OnboardingItemView(item: item, index: 0, handler: {})
    }
}
