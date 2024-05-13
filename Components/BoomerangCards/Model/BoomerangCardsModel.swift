//
//  BoomerangCardsModel.swift
//  Components
//
//  Created by 강치우 on 5/14/24.
//

import SwiftUI

// MARK: Card Model
struct BoomerangCardsModel: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var isRotated: Bool = false
    var extraOffset: CGFloat = 0
    var scale: CGFloat = 1
    var zIndex: Double = 0
}
