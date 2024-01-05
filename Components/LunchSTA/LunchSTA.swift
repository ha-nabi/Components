//
//  SwiftUIView.swift
//  Components
//
//  Created by 강치우 on 1/5/24.
//

import SwiftUI

struct LunchSTA: View {
    
    @State var show = false
    let title = "PADO"
    private var initialDelays = [0.0, 0.04, 0.012, 0.18, 0.28, 0.35]
    
    var body: some View {
        ZStack {
            ZStack {
                AnimatedTitleView(title: title, color: .num1, initialDelay: initialDelays[5], animationType: .spring(duration: 1))
                AnimatedTitleView(title: title, color: .num2, initialDelay: initialDelays[4], animationType: .spring(duration: 1))
                AnimatedTitleView(title: title, color: .num3, initialDelay: initialDelays[3], animationType: .spring(duration: 1))
                AnimatedTitleView(title: title, color: .num4, initialDelay: initialDelays[2], animationType: .spring(duration: 1))
                AnimatedTitleView(title: title, color: .num5, initialDelay: initialDelays[1], animationType: .spring(duration: 1))
            }
            
            AnimatedTitleView(title: title, color: .white, initialDelay: initialDelays[0], animationType: .spring)
        }
    }
}

#Preview {
    LunchSTA()
}
