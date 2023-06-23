//
//  SwiftUIView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 22/06/23.
//

import SwiftUI

struct ImageCustomView: View {
    @EnvironmentObject var sense: Sense
    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            Image(sense.imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .foregroundColor(Color("Color_rose").opacity(0.9))
                .scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.25)) {
                        scale = 1.1 * scale
                    }
                }
        }
    }
}

struct ImageCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCustomView()
    }
}
