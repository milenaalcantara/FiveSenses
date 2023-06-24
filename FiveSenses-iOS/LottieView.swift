//
//  ContentView.swift
//  lottie-animations
//
//  Created by Davi Capistrano
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name: String

    let animationView = LottieAnimationView()

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        animationView.animation = .asset(name)
        animationView.contentMode = .scaleAspectFit
        animationView.play()

        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}


//struct LottieAnimationView: UIViewRepresentable {
//    let name: String
//
//    func makeUIView(context: UIViewRepresentableContext<LottieAnimationView>) -> some UIView {
//
//        let view = UIView(frame: .zero)
//        let animationView = LottieAnimationView(name: name)
//        animationView.animation = animation
//
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .repeat(5)
//        animationView.play()
//
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(LottieAnimationView)
//        NSLayoutConstraint.activate([
//            LottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            LottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor)
//
//        ])
//        return view
//}
//func updateUIView(_ uiView: UIViewType, context: Context){
//
//}
//}
