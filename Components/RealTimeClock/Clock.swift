//
//  Clock.swift
//  Components
//
//  Created by 강치우 on 12/27/23.
//

import SwiftUI

struct Clock: View {
    @State private var now = Date()
    
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 2) {
                    FlipClockNumberView(number: now.component(.hour) / 10)
                    FlipClockNumberView(number: now.component(.hour) % 10)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                
                HStack(spacing: 2) {
                    FlipClockNumberView(number: now.component(.minute) / 10)
                    FlipClockNumberView(number: now.component(.minute) % 10)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                
                HStack(spacing: 2) {
                    FlipClockNumberView(number: now.component(.second) / 10)
                    FlipClockNumberView(number: now.component(.second) % 10)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            .onReceive(timer, perform: { input in
                now = input
            })
            .navigationTitle("Clock App")
        }
    }
}

#Preview {
    Clock()
}
