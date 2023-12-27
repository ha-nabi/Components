//
//  FlipClockNumberView.swift
//  Components
//
//  Created by 강치우 on 12/27/23.
//

import SwiftUI

struct FlipClockNumberView: View {
    
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .font(.system(size: 180, weight: .bold, design: .default))
            .foregroundStyle(.white)
            .frame(width: 160, height: 180)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
    }
}

extension Date {
    func component(_ component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        return calendar.component(component, from: self)
    }
}
