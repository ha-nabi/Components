//
//  Card.swift
//  Components
//
//  Created by 강치우 on 11/6/23.
//

import SwiftUI

// Card Model and Sample Cards
struct Card: Identifiable {
    var id: UUID = .init()
    var bgColor: Color
    var balance: String
}

var cards: [Card] = [
    Card(bgColor: .red, balance: "$125,000"),
    Card(bgColor: .blue, balance: "$25,000"),
    Card(bgColor: .orange, balance: "$25,000"),
    Card(bgColor: .purple, balance: "$5,000")
]
