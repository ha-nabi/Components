//
//  OffsetKye.swift
//  Components
//
//  Created by 강치우 on 5/7/24.
//

import SwiftUI

struct OffsetKey1: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    static func reduce(value: inout [String : Anchor<CGRect>], nextValue: () -> [String : Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}
