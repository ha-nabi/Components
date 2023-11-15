//
//  Like.swift
//  Components
//
//  Created by 강치우 on 11/16/23.
//

import SwiftUI

// Like Animation Model
struct Like: Identifiable {
    var id: UUID = .init()
    var tappedRect: CGPoint = .zero
    var isAnimated: Bool = false
}
