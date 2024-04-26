//
//  SwiftUIView.swift
//  Components
//
//  Created by 강치우 on 1/18/24.
//

import SwiftUI

struct ImageParalaxView: View {
    @State private var textPosition = CGPoint(x: 100, y: 100)
    @State private var dragStart: CGPoint?
    @State private var textLabel = "여기에 텍스트를 입력하세요"

    var body: some View {
        ZStack {
            Image("pp1")
                .resizable()
                .scaledToFit()

            Text(textLabel)
                .foregroundColor(.white)
                .padding(10)
                .position(textPosition)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if dragStart == nil {
                                dragStart = gesture.startLocation
                            }
                            let dragAmount = CGPoint(x: gesture.translation.width, y: gesture.translation.height)
                            let initialPosition = dragStart ?? CGPoint.zero
                            self.textPosition = CGPoint(x: initialPosition.x + dragAmount.x, y: initialPosition.y + dragAmount.y)
                        }
                        .onEnded { _ in
                            dragStart = nil
                        }
                )
        }
    }
}

#Preview {
    ImageParalaxView()
}
