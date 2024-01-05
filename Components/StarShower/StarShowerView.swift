//
//  StarShowerView.swift
//  Components
//
//  Created by 강치우 on 12/30/23.
//

import SwiftUI

struct Star {
    var position: CGPoint
    var velocity: CGFloat
}

struct StarShowerView: View {
    
    @State private var stars: [Star] = []
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common)
        .autoconnect()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        Canvas { context, size in
            for star in stars {
                let conterxtCopy = context
                let rect = CGRect(x: star.position.x, y: star.position.y, width: 2, height: 2)
                conterxtCopy.fill(Path(ellipseIn: rect), with: .color(.white))
            }
        }
        .background(Color.black)
        .onAppear {
            for _ in 0..<100 {
                let star = Star(position: CGPoint(x: CGFloat.random(in: 0...screenWidth), y: CGFloat.random(in: 0...screenHeight)),
                                velocity: CGFloat.random(in: 2...5)
                )
                stars.append(star)
            }
        }
        .onReceive(timer) { _ in
            for i in 0..<stars.count {
                stars[i].position.y += stars[i].velocity
                if stars[i].position.y > screenHeight {
                    stars[i].position = CGPoint(x: CGFloat.random(in: 0...screenWidth), y: 0)
                }
            }
        }
        .overlay {
            Text("PADO")
                .foregroundStyle(.white)
                .font(.system(size: 40))
                .fontWeight(.heavy)
        }
    }
}

#Preview {
    StarShowerView()
}
