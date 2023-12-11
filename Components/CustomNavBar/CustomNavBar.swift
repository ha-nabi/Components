//
//  CustomNavBar.swift
//  Components
//
//  Created by 강치우 on 12/11/23.
//

import SwiftUI

struct CustomNavBar: View {
    
    @State var isScroll: Bool = false
    
    var body: some View {
        ScrollView {
            getScrollOffsetReader()
            CardView()
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(scrollPreKey.self, perform: { value in
            updateScrollStatus(value: value)
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear
                .frame(height: 30)
        })
        .overlay {
            VanDarView(isScroll: $isScroll)
        }
    }
    
    struct scrollPreKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
    
    func updateScrollStatus(value: CGFloat) {
        withAnimation(.default) {
            isScroll = value < 0
        }
    }
    
    func getScrollOffsetReader() -> some View {
        GeometryReader { proxy in
            Color.clear.preference(key: scrollPreKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
    }
    
}

#Preview {
    CustomNavBar()
}




