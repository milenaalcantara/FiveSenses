//
//  OnboardingItem.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 19/06/23.
//

import Foundation

struct OnboardingItem: Identifiable {
    var id = UUID()
    var illustration: String?
    var title: String?
    var content: String?
    var height: CGFloat = 250
    var width: CGFloat = 250
}
