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
            HStack(alignment: .center) {
                ForEach(SenseOptions.allCases, id: \.self) { sense in
                    ImageCustom(item: .init(name: sense.imageName, width: widthScreen * 0.15))
                }
//                ImageCustom(item: .init(name: sense.imageName, width: widthScreen * 0.15))
//                ImageCustom(item: .init(name: sense.imageName, width: widthScreen * 0.15))
//                ImageCustom(item: .init(name: sense.imageName, width: widthScreen * 0.15))
//                ImageCustom(item: .init(name: sense.imageName, width: widthScreen * 0.15))
//                ImageCustom(item: .init(name: sense.imageName, width: widthScreen * 0.15))
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


