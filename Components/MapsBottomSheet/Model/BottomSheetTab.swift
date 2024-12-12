//
//  BottomSheetTab.swift
//  Components
//
//  Created by 강치우 on 12/12/24
//  Copyright © 2022 Vlip (xperiventure). All rights reserved.
//

import SwiftUI

enum BottomSheetTab: String, CaseIterable {
    case people = "People"
    case devices = "Devices"
    case items = "Items"
    case me = "Me"
    
    var symbol: String {
        switch self {
        case .people:
            "figure.2.arms.open"
        case .devices:
            "macbook.and.iphone"
        case .items:
            "circle.grid.2x2.fill"
        case .me:
            "person.circle.fill"
        }
    }
}
