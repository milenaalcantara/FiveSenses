//
//  ProgressBar.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import SwiftUI

struct HeaderSenseView: View {
    @EnvironmentObject var sense: Sense
    
    private let widthScreen = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(sense.color.opacity(0.9))
                    .frame(
                        width: widthScreen * 0.2,
                        height: widthScreen * 0.2
                    )
                
                Image(systemName: sense.icon)
                    .foregroundColor(.white.opacity(0.95))
                    .font(.title)
            }
            
            ProgressView(value: sense.progress)
                .progressViewStyle(BarProgressStyle(height: 30))
                .padding()
            
            Text(sense.iosDescription)
                .padding(.bottom, 20)
        }
    }
}

struct HeaderSenseView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSenseView()
    }
}


