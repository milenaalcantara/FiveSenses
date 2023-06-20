//
//  OnboardingView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 19/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var SlideGesture = CGSize.zero
    @State var SlideOne = false
    @State var SlideOnePrevious = false
    @State var SlideTwo = false
    @State var SlideTwoPrevious = false
    
    var body: some View {
        ZStack {
            OnboardingThree()
                .offset(x: SlideGesture.width)
                .offset(x: SlideTwo ? 0 : 500)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width > 150 {
                            self.SlideTwo = false
                            self.SlideTwoPrevious = true
                        }
                        self.SlideGesture = .zero
                    }
            )
            
            
            
            OnboardingTwo()
                .offset(x: SlideGesture.width)
                .offset(x: SlideOne ? 0 : 500)
                .offset(x: SlideOnePrevious ? 500 : 0)
                .offset(x: SlideTwo ? -500 : 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width < -150 {
                            self.SlideOne = true
                            self.SlideTwo = true
                           
                        }
                        
                        if self.SlideGesture.width > 150 {
                            self.SlideOnePrevious = true
                            self.SlideOne = false
                            
                        }
                        self.SlideGesture = .zero
                    }
            )
            
                
            OnboardingOne()
                .ignoresSafeArea()
                .offset(x: SlideGesture.width)
                .offset(x: SlideOne ? -500 : 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width < -150 {
                            self.SlideOne = true
                            self.SlideOnePrevious = false
                        }
                        self.SlideGesture = .zero
                    }
            )
            
            VStack {
                Spacer()
                
                ZStack {
                    NavigationLink {
                        HomeView()
                    } label: {
                        Text("Iniciar")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 200, height: 54)
                    .background(Color.green)
                    .cornerRadius(20)
                    .animation(.spring())
                    .offset(x: SlideTwo ? 0 : 500)
                    
                    VStack {
                        Text("Skip")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 140, height: 40)
                    .background(Color.black)
                    .cornerRadius(20)
                    .animation(.spring())
                    .offset(x: SlideTwo ? -500 : 0)
                
//                    NavigationLink {
//                        HomeView()
//                    } label: {
//                        Text("Próximo")
//                            .font(.system(size: 17, weight: .medium, design: .rounded))
//                            .foregroundColor(Color.white)
//                    }
//                    .frame(width: 200, height: 54)
//                    .background(Color.black)
//                    .cornerRadius(20)
//                    .animation(.spring())
//                    .offset(x: SlideTwo ? -500 : 0)
                }
            }
            
            
//            VStack {
//                Spacer()
//                ZStack {
//                    VStack {
//                        Text("Complete")
//                            .font(.system(size: 17, weight: .medium, design: .rounded))
//                            .foregroundColor(Color.white)
//                    }
//                    .frame(width: 140, height: 40)
//                    .background(Color.green)
//                    .cornerRadius(20)
//                    .animation(.spring())
//                    .offset(x: SlideTwo ? 0 : 500)
//
//                    VStack {
//                        Text("Skip")
//                            .font(.system(size: 17, weight: .medium, design: .rounded))
//                            .foregroundColor(Color.white)
//                    }
//                    .frame(width: 140, height: 40)
//                    .background(Color.black)
//                    .cornerRadius(20)
//                    .animation(.spring())
//                    .offset(x: SlideTwo ? -500 : 0)
//
//                }
//            }
        }
        .background(Color("Color03"))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
