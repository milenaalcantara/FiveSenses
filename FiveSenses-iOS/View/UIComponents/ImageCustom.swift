//
//  ImageCustom.swift
//  FiveSenses-iOS
//
//  Created by Davi Capistrano on 22/06/23.
//

import SwiftUI

struct ImageSenseModel {
    let name: String?
    let width: CGFloat?
}

struct ImageCustom: View {
    @EnvironmentObject var sense: Sense
    @State private var scale: CGFloat = 1

    var item: ImageSenseModel

    var body: some View {
        Image(item.name ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: item.width ?? 50, height: item.width ?? 50)
            .scaleEffect(scale)
//            .onAppear {
//                if sense.imageName == item.name {
//                    withAnimation(.easeIn.speed(0.5)) {
//                        scale = scale * 1.2
//                        print("auquiiii")
//                    }
//                } else {
//                    withAnimation(.easeOut.speed(0.5)) {
//                        scale = scale * 1
//                    }
//                }
//            }
//            .onChange(of: sense.senseOption) { newValue in
//                if sense.imageName == item.name {
//                    withAnimation(.easeIn.speed(0.5)) {
//                        scale = scale * 1.2
//                        print("auquiiii")
//                    }
//                } else {
//                    withAnimation(.easeOut.speed(0.5)) {
//                        scale = scale * 1
//                    }
//                }
//            }
        
    }
}

struct ImageCustom_Previews: PreviewProvider {
    static var previews: some View {
        ImageCustom(item: .init(name: "vision", width: 50))
    }
}
