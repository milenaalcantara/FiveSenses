//
//  BarProgressStyle.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 14/06/23.
//

import Foundation
import SwiftUI

struct BarProgressStyle: ProgressViewStyle {
    @EnvironmentObject var sense: Sense
    let height: CGFloat

    func makeBody(configuration: Configuration) -> some View {

        let progress = configuration.fractionCompleted ?? 0.0
        
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 12.0)
                .fill(sense.color.opacity(0.3))
                .frame(
                    width: geometry.size.width
                )
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(sense.color.opacity(0.9))
                        .frame(width: geometry.size.width * progress * 0.89)
                }
        }
        .frame(height: height)
    }
}
