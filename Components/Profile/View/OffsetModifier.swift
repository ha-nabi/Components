//
//  OffsetModifier.swift
//  Components
//
//  Created by 강치우 on 1/30/24.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @State var startValue: CGFloat = 0
    
    var returnFromStart: Bool = true
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKeys.self, value: proxy.frame(in: .named("SCROLL")).minY)
                        .onPreferenceChange(OffsetKeys.self) { value in
                            if startValue == 0 {
                                startValue = value
                            }
                            
                            offset = (value - (returnFromStart ? startValue : 0))
                        }
                }
            }
    }
}

struct OffsetKeys: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
