//
//  Tab.swift
//  Components
//
//  Created by 강치우 on 4/30/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case men = "Men"
    case women = "Women"
    case kids = "Kids"
    case living = "Living"
    case game = "Games"
    case outing = "Outing"
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
    
    var count: Int {
        return Tab.allCases.count
    }
}
