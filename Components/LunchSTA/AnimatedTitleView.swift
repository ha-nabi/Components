//
//  LunchMainView.swift
//  Components
//
//  Created by 강치우 on 1/5/24.
//

import SwiftUI

struct AnimatedTitleView: View {
    
    let title: String
    let color: Color
    let initialDelay: Double
    let animationType: Animation
    
    @State var scall = false
    @State private var show = false
    
    private var delayStep = 0.1
    init(title: String, color: Color, initialDelay: Double, animationType: Animation, scall: Bool = false, show: Bool = false, delayStep: Double = 0.1) {
        self.title = title
        self.color = color
        self.initialDelay = initialDelay
        self.animationType = animationType
    }
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<title.count, id: \.self) { index in
                Text(String(title[title.index(title.startIndex, offsetBy: index)]))
                    .font(.system(size: 80))
                    .opacity(show ? 1 : 0)
                    .fontWeight(.bold)
                    .offset(y: show ? -30 : 30)
                    .animation(animationType.delay(Double(index) * delayStep + initialDelay), value: show)
                    .foregroundStyle(color)
            }
        }
        .scaleEffect(scall ? 1 : 1.2)
        .onAppear {
            show.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    scall.toggle()
                }
            }
        }
    }
}
